clear all
figure1 = uifigure('Color',[12 186 166]/255,'WindowState','maximized');

%Definimos los gauges
gauge_flexion = uigauge(figure1,'semicircular','Position',[630 300 1 1], Limits=[0 100]);
gauge_flexion.Value = 0;
gauge_flexion.ScaleColors=[1 1 0; 0 1 0];
% gauge_flexion.ScaleColorLimits=[0 50; 50 100];
gauge_flexion.MajorTicks = [0 10 20 30 40 50 60 70 80 90 100];

gauge_extension= uigauge(figure1,'semicircular','Position',[750 300 1 1], Limits=[0 100]);
gauge_extension.Value=0;
gauge_extension.ScaleColors=[1 1 0; 0 1 0];
% gauge_extension.ScaleColorLimits=[0 50; 50 100];
gauge_extension.MajorTicks = [0 10 20 30 40 50 60 70 80 90 100];

%Definimos los textos de las figuras
titulo=annotation(figure1,'textbox',[.01 .95 1 0.05],'String','MODO 3','EdgeColor','none','Fontsize',40,'FontWeight','bold');
textFlex=annotation(figure1,'textbox',[.53 .7 .05 .05],'String','Flexión','EdgeColor','none','Fontsize',20,'FontWeight','bold');
textExt=annotation(figure1,'textbox',[.83 .7 .05 .05],'String','Extensión','EdgeColor','none','Fontsize',20,'FontWeight','bold');

ellipse_seleccionar=annotation(figure1,'ellipse',[0.076281112737922 0.408602150537634 0.136017569546119 0.268709677419355]);
ellipse_mover=annotation(figure1,'ellipse',[0.25856515373353 0.408602150537634 0.13601756954612 0.268709677419355]);

Flexion=annotation(figure1,'textbox',[0.120326500732064 0.490015361761352 0.0475841862085449 0.0414746535996321],'String','-Flexión','FitBoxToText','off');
Extension=annotation(figure1,'textbox',[0.300414348462666 0.490015361761351 0.0592972166061752 0.0414746535996321],'String','+Extensión','FitBoxToText','off');

Mover_derecha=annotation(figure1,'textbox',[0.279648609077599 0.549923195084486 0.111273792093704 0.0491551459293272],'Color',[1 1 1],'String','MOVER DERECHA','FontWeight','bold','FitBoxToText','on','EdgeColor','none');
Seleccionar=annotation(figure1,'textbox',[0.104221083455345 0.557603687414182 0.0885797926002502 0.0414746535996321],'Color',[1 1 1],'String','SELECCIONAR','FontWeight','bold','FitBoxToText','on','EdgeColor','none');

%Definir variables
tiempo=0;
unity='0';
command=0;
estado=1;
numero_flexiones=0;
numero_extensiones=0;
numero_cocontracciones=0;

%Umbrales
umbral_flexion=40;
umbral_extension=40;


threshold=[umbral_flexion umbral_extension];

gauge_flexion.ScaleColorLimits=[0 umbral_flexion; umbral_flexion 100];
gauge_extension.ScaleColorLimits=[0 umbral_extension; umbral_extension 100];

pause(1)

%Iniciar Noraxon
%[stream_config, sensor_selection] = noraxon_stream_init('127.0.0.1', '9220');
%Matlab como cliente
load ("seleccion.mat");
tcpipClient = tcpip('127.0.0.1',55002,'NetworkRole','Client');


%BUCLE DE CONTROL
tic 

while tiempo<=5000000  %Está en segundos
    
    %Recoger datos Noraxon
    data = noraxon_stream_collect(stream_config, 0.3);
    f_amp=mean(data(1).samples(:));
    e_amp=mean(data(2).samples(:));
%     prompt = 'famp? ';
%     x = input(prompt);
%     f_amp = x;
%     prompt = 'eamp ';
%     y = input(prompt);
%     e_amp = y;
    
    gauge_flexion.Value = f_amp;
    gauge_extension.Value=e_amp;

    if f_amp>threshold(1) && e_amp<threshold(2)
        command=1;
    elseif f_amp<threshold(1) && e_amp>threshold(2)
        command=2;
    elseif f_amp>threshold(1) && e_amp>threshold(2)
        command=3;
    else
        command=0;  
    end

    for i=1 :1: 3000
        salida_comand(i)=command;
    end 

    %Realizamos la moda
    command_moda = mode (salida_comand);


    if command_moda ==1

        numero_flexiones=numero_flexiones+1;

    elseif command_moda==2

        numero_extensiones=numero_extensiones+1;

    elseif command_moda==3

        numero_cocontracciones=numero_cocontracciones+1;

    end

    switch command_moda
        
        case 1 %Flexion
            Flexion.EdgeColor='y';
            Extension.EdgeColor='k';
            drawnow
            unity='1';
            set(tcpipClient,'Timeout',30);
            fopen(tcpipClient);
            fwrite(tcpipClient,unity);
            fclose(tcpipClient);
            salida_comand=[];
            pause(0.1);
            
         
        case 2 %Extension
            Flexion.EdgeColor='k';
            Extension.EdgeColor='y';
            drawnow
            unity='2';
            set(tcpipClient,'Timeout',30);
            fopen(tcpipClient);
            fwrite(tcpipClient,unity);
            fclose(tcpipClient);
            salida_comand=[];
            pause(0.1);
            

                 
        otherwise   
            Flexion.EdgeColor='k';
            Extension.EdgeColor='k';
            unity='0';
            set(tcpipClient,'Timeout',30);
            fopen(tcpipClient);
            fwrite(tcpipClient,unity);
            fclose(tcpipClient);
            drawnow
                
    end

 tiempo = toc;
        
end

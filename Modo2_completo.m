clear all

figure1 = uifigure('Color',[12 186 166]/255,'WindowState','maximized');

%Definimos los gauges
gauge_flexion = uigauge(figure1,'semicircular','Position',[760 350 1 1], Limits=[0 100]);
gauge_flexion.Value = 20;
gauge_flexion.ScaleColors=[1 1 0; 0 1 0];
% gauge_flexion.ScaleColorLimits=[0 50; 50 100];
gauge_flexion.MajorTicks = [0 10 20 30 40 50 60 70 80 90 100];

gauge_extension= uigauge(figure1,'semicircular','Position',[760 180 1 1], Limits=[0 100]);
gauge_extension.Value=0;
gauge_extension.ScaleColors=[1 1 0; 0 1 0];
% gauge_extension.ScaleColorLimits=[0 50; 50 100];
gauge_extension.MajorTicks = [0 10 20 30 40 50 60 70 80 90 100];

%Definimos los textos de las figuras
titulo=annotation(figure1,'textbox',[.01 .95 1 0.05],'String','MODO 2','EdgeColor','none','Fontsize',40,'FontWeight','bold');
textFlex=annotation(figure1,'textbox',[.735 .92 .05 .05],'String','Flexión','EdgeColor','none','Fontsize',20,'FontWeight','bold');
textExt=annotation(figure1,'textbox',[.73 .47 .05 .05],'String','Extensión','EdgeColor','none','Fontsize',20,'FontWeight','bold');

logo1=imread('ejes.png');
im = uiimage(figure1);
im.ImageSource = logo1;
im.Position = [160 128 300 150]; %[distancia_margen_izq distancia_margen_bajo tamaño_x tamaño_y]

annotation(figure1,'arrow',[0.310395314787702 0.398975109809663],[0.862287250384025 0.427035330261137]);
annotation(figure1,'arrow',[0.0885797950219619 0.18814055636896],[0.431643625192012 0.854070660522274]);
annotation(figure1,'arrow',[0.338213762811128 0.145680819912152],[0.309291858678956 0.310291858678955]);

Nodo1=annotation(figure1,'textbox',[0.223279648609078 0.906298003072196 0.0573689590067681 0.0384024577572846],'Color',[1 1 1],'String','NODO 1:','FontWeight','bold','FitBoxToText','on','EdgeColor','none');
Nodo2=annotation(figure1,'textbox',[0.374816983894583 0.360983102918587 0.0573689590067681 0.0384024577572846],'Color',[1 1 1],'String','NODO 2:','FontWeight','bold','FitBoxToText','on','EdgeColor','none');
Nodo3=annotation(figure1,'textbox',[0.0563689604685219 0.36405529953917 0.0573689590067682 0.0384024577572846],'Color',[1 1 1],'String','NODO 3:','FontWeight','bold', 'FitBoxToText','on','EdgeColor','none');
MOVX=annotation(figure1,'textbox',[0.20671010248902 0.880184332575473 0.0885797926002503 0.0414746535996321],'Color',[1 1 1],'String',{'MOVIMIENTO X'},'FontWeight','bold','FitBoxToText','on','EdgeColor','none');
MOVZ=annotation(figure1,'textbox',[0.360443631039533 0.336405530732155 0.0885797926002503 0.0414746535996322],'Color',[1 1 1],'String','MOVIMIENTO Z','FontWeight','bold','FitBoxToText','on','EdgeColor','none');
GRASP=annotation(figure1,'textbox',[0.0595651537335305 0.339477727352738 0.0885797926002501 0.0414746535996322],'Color',[1 1 1],'String','GRASP','FontWeight','bold','FitBoxToText','on','EdgeColor','none');

ellipse_nodo1=annotation(figure1,'ellipse',[0.189677891654466 0.738786482334869 0.12 0.23]);
ellipse_nodo2=annotation(figure1,'ellipse',[0.338360175695462 0.193855606758832 0.12 0.23]);
ellipse_nodo3=annotation(figure1,'ellipse',[0.0229136163982436 0.198079877112135 0.12 0.23]);

Contraccion_modo_1_2=annotation(figure1,'textbox',[0.363371888726211 0.628264209687616 0.0819912130015839 0.0414746535996321],'String','Co-contracción','FitBoxToText','off');
Contraccion_modo_2_3=annotation(figure1,'textbox',[0.197193265007322 0.253456221976402 0.0819912130015841 0.041474653599632],'String','Co-contracción','FitBoxToText','off');
Contraccion_modo_3_1=annotation(figure1,'textbox',[0.0471200585651566 0.619047619825862 0.0819912130015844 0.0414746535996321],'String','Co-contracción','FitBoxToText','off');

Extension_nodo1=annotation(figure1,'textbox',[0.220619326500733 0.823348695094685 0.0592972166061751 0.0414746535996321],'String','+Extensión','FitBoxToText','off');
Extension_nodo2=annotation(figure1,'textbox',[0.372156661786238 0.279569893251366 0.0592972166061752 0.0414746535996321],'String','+Extensión','FitBoxToText','off');
%Extension_nodo3=annotation(figure1,'textbox',[0.0529765739385072 0.281105991561659 0.0592972166061752 0.0414746535996321],'String','+Extensión','FitBoxToText','off');

Flexion_nodo1=annotation(figure1,'textbox',[0.225743777452416 0.772657450855053 0.0475841862085449 0.0414746535996321], 'String','-Flexión','FitBoxToText','off');
Flexion_nodo2=annotation(figure1,'textbox',[0.379477306002928 0.22427035408086 0.0475841862085449 0.0414746535996321],'String','-Flexión','FitBoxToText','off');
Flexion_nodo3=annotation(figure1,'textbox',[0.0573689604685212 0.27 0.0475841862085448 0.0414746535996321],'String','-Flexión','FitBoxToText','off');



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

    switch estado
        %Movimiento en x
        case 1
            ellipse_nodo3.EdgeColor='k';
            ellipse_nodo1.EdgeColor='y';
            switch command_moda
                case 0 %Reposo
                    Extension_nodo1.EdgeColor='k';
                    Flexion_nodo1.EdgeColor='k';
                    drawnow
                    unity='0';
                    set(tcpipClient,'Timeout',30);
                    fopen(tcpipClient);
                    fwrite(tcpipClient,unity);
                    fclose(tcpipClient);
                 
                case 1 %Flexión
                    Extension_nodo1.EdgeColor='k';
                    Flexion_nodo1.EdgeColor='y';
                    drawnow 
                    unity='1';
                    set(tcpipClient,'Timeout',30);
                    fopen(tcpipClient);
                    fwrite(tcpipClient,unity);
                    fclose(tcpipClient);
                
                case 2 %Extensión
                    Extension_nodo1.EdgeColor='y';
                    Flexion_nodo1.EdgeColor='k';
                    drawnow 
                    unity='2';
                    set(tcpipClient,'Timeout',30);
                    fopen(tcpipClient);
                    fwrite(tcpipClient,unity);
                    fclose(tcpipClient);
        
                case 3 %Co-contracción
                    Extension_nodo1.EdgeColor='k';
                    Flexion_nodo1.EdgeColor='k';
                    Contraccion_modo_1_2.EdgeColor='y';
                    ellipse_nodo1.EdgeColor='k';
                    unity='0';
                    set(tcpipClient,'Timeout',30);
                    fopen(tcpipClient);
                    fwrite(tcpipClient,unity);
                    fclose(tcpipClient);
                    pause(1);
                    salida_comand=[];
                    Contraccion_modo_1_2.EdgeColor='k';
                    ellipse_nodo2.EdgeColor='y';
                    pause(0.01)
                    estado = 2;
            end
     
        %Movimiento en z
        case 2
            switch command_moda
                case 0 %Reposo
                    Extension_nodo2.EdgeColor='k';
                    Flexion_nodo2.EdgeColor='k';
                    drawnow
                    unity='0';
                    set(tcpipClient,'Timeout',30);
                    fopen(tcpipClient);
                    fwrite(tcpipClient,unity);
                    fclose(tcpipClient);
                     
                case 1 %Flexion
                    Extension_nodo2.EdgeColor='k';
                    Flexion_nodo2.EdgeColor='y';
                    drawnow 
                    unity='3';
                    set(tcpipClient,'Timeout',30);
                    fopen(tcpipClient);
                    fwrite(tcpipClient,unity);
                    fclose(tcpipClient);

                case 2 %Extensión
                    Extension_nodo2.EdgeColor='y';
                    Flexion_nodo2.EdgeColor='k';
                    drawnow 
                    unity='4';
                    set(tcpipClient,'Timeout',30);
                    fopen(tcpipClient);
                    fwrite(tcpipClient,unity);
                    fclose(tcpipClient);
            
                case 3 %Co-contracción
                    Extension_nodo2.EdgeColor='k';
                    Flexion_nodo2.EdgeColor='k';
                    Contraccion_modo_2_3.EdgeColor='y';
                    ellipse_nodo2.EdgeColor='k';
                    unity='0';
                    set(tcpipClient,'Timeout',30);
                    fopen(tcpipClient);
                    fwrite(tcpipClient,unity);
                    fclose(tcpipClient);
                    pause(1);
                    salida_comand=[];
                    Contraccion_modo_2_3.EdgeColor='k';
                    ellipse_nodo3.EdgeColor='y';
                    pause(0.01)
                    estado = 3;
            end
            
        %Movimiento coger
        case 3
            switch command_moda
                case 0 %Reposo
                    %Extension_nodo3.EdgeColor='k';
                    Flexion_nodo3.EdgeColor='k';
                    drawnow
                    unity='0';
                    set(tcpipClient,'Timeout',30);
                    fopen(tcpipClient);
                    fwrite(tcpipClient,unity);
                    fclose(tcpipClient);
                   
                case 1 %Flexion
                    Flexion_nodo3.EdgeColor='y';
                    drawnow 
                    unity='5';
                    set(tcpipClient,'Timeout',30);
                    fopen(tcpipClient);
                    fwrite(tcpipClient,unity);
                    fclose(tcpipClient);
                    ellipse_nodo3.EdgeColor='k';
                    pause(2);
                    Flexion_nodo3.EdgeColor='k';
                    ellipse_nodo1.EdgeColor='y';
                    estado = 1;
                    
                case 3
                    Flexion_nodo3.EdgeColor='k';
                    Contraccion_modo_3_1.EdgeColor='y';
                    ellipse_nodo3.EdgeColor='k';
                    unity='0';
                    set(tcpipClient,'Timeout',30);
                    fopen(tcpipClient);
                    fwrite(tcpipClient,unity);
                    fclose(tcpipClient);
                    pause(1);
                    salida_comand=[];
                    Contraccion_modo_3_1.EdgeColor='k';
                    ellipse_nodo1.EdgeColor='y';
                    pause(0.01)
                    estado = 1;
            end
        otherwise   
                estado=1; 
    end

 tiempo = toc;
        
end




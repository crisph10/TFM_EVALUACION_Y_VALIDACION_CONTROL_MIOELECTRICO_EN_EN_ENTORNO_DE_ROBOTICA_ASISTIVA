% function createfigure1
%CREATEFIGURE1
% Creamos la figura
clear all
figure1 = uifigure('Color',[12 186 166]/255,'WindowState','maximized');

%% GAUGES DE VALORES DE FLEXIÓN Y EXTENSIÓN

%Definimos los gauges
gauge_flexion = uigauge(figure1,'semicircular','Position',[750 60 1 1], Limits=[0 100]);
%gauge_flexion.Value = x;
gauge_flexion.ScaleColors=[1 1 0; 0 1 0];
% gauge_flexion.ScaleColorLimits=[0 50; 50 100];
gauge_flexion.MajorTicks = [0 10 20 30 40 50 60 70 80 90 100];

gauge_extension= uigauge(figure1,'semicircular','Position',[780 60 1 1], Limits=[0 100]);
% gauge_extension.Value=y;
gauge_extension.ScaleColors=[1 1 0; 0 1 0];
% gauge_extension.ScaleColorLimits=[0 50; 50 100];
gauge_extension.MajorTicks = [0 10 20 30 40 50 60 70 80 90 100];

%Definimos los textos de las figuras
titulo=annotation(figure1,'textbox',[.01 .95 1 0.05],'String','MODO 1','EdgeColor','none','Fontsize',40,'FontWeight','bold');
textFlex=annotation(figure1,'textbox',[.570 .33 .05 .05],'String','Flexión','EdgeColor','none','Fontsize',20,'FontWeight','bold');
textExt=annotation(figure1,'textbox',[.828 .33 .05 .05],'String','Extensión','EdgeColor','none','Fontsize',20,'FontWeight','bold');

logo1=imread('ejes.png');
%uiaxes(figure1,'Position',[0.17 0.45 .2 .2]);
%imshow(logo1, 'parent', app.UIAxes);



im = uiimage(figure1);
im.ImageSource = logo1;
im.Position = [200 45 300 150];
    
% Create arrow
annotation(figure1,'arrow',[0.320644216691069 0.409224011713031],...
    [0.82542089093702 0.682027649769585]);

annotation(figure1,'arrow',[0.414348462664714 0.322840409956076],...
    [0.447540706605223 0.302611367127496]);

annotation(figure1,'arrow',[0.199121522693997 0.109077598828697],...
    [0.306219662058372 0.442396313364055]);

annotation(figure1,'arrow',[0.108345534407028 0.197657393850659],...
    [0.679491551459293 0.838709677419355]);
Extension_nodo1=annotation(figure1,'textbox',...
    [0.233064421669107 0.817204301853513 0.0592972166061751 0.0414746535996322],...
    'String','+Extensión');
Extension_nodo2=annotation(figure1,'textbox',...
    [0.388262079062958 0.536098311070107 0.0592972166061751 0.0414746535996322],...
    'String','+Extensión');
Extension_nodo3=annotation(figure1,'textbox',...
    [0.233796486090776 0.241167435494069 0.0592972166061751 0.0414746535996321],...
    'String','+Extensión');
Extension_nodo4=annotation(figure1,'textbox',...
    [0.0764026354319181 0.536098311070106 0.0592972166061751 0.0414746535996322],...
    'String','+Extensión');
Flexion_nodo1=annotation(figure1,'textbox',...
    [0.23892093704246 0.768049155924177 0.0475841862085449 0.0414746535996322],...
    'String','-Flexión');
Flexion_nodo2=annotation(figure1,'textbox',...
    [0.391190336749634 0.482334870209892 0.0475841862085449 0.0414746535996321],...
    'String','-Flexión');
Flexion_nodo3=annotation(figure1,'textbox',...
    [0.23818887262079 0.185867896323563 0.0475841862085449 0.0414746535996321],...
    'String','-Flexión');
Flexion_nodo4=annotation(figure1,'textbox',...
    [0.0822591508052711 0.485407066830475 0.0475841862085449 0.0414746535996321],...
    'String','-Flexión');
Contraccion_modo_1_2=annotation(figure1,'textbox',...
    [0.36337188872621 0.76804915592417 0.0819912130015836 0.0414746535996322],...
    'String','Co-contracción');
Contraccion_modo_2_3=annotation(figure1,'textbox',...
    [0.369960468521232 0.324116744249828 0.0819912130015836 0.0414746535996321],...
    'String','Co-contracción');
Contraccion_modo_3_4=annotation(figure1,'textbox',...
    [0.070546120058566 0.328725039180703 0.0819912130015836 0.0414746535996321],...
    'String','Co-contracción');
Contraccion_modo_4_1=annotation(figure1,'textbox',...
    [0.0668857979502214 0.768049155924172 0.0819912130015836 0.0414746535996322],...
    'String','Co-contracción');
Nodo1=annotation(figure1,'textbox',...
    [0.235992679355783 0.88632872581664 0.0563689590067675 0.0414746535996322],...
    'Color',[1 1 1],'FontWeight', 'bold',...
    'String',{'NODO 1:'},...
    'EdgeColor','none');
MOVY=annotation(figure1,'textbox',...
    [0.217691068814056 0.857142857921096 0.0885797926002506 0.0414746535996322],...
    'String',{'MOVIMIENTO Y'},'Color',[1 1 1],'FontWeight', 'bold',...
    'EdgeColor','none');
Nodo2=annotation(figure1,'textbox',...
    [0.389458272327965 0.617511520737327 0.057368959006768 0.0384024577572845],...
    'String',{'NODO 2:'},'Color',[1 1 1],'FontWeight', 'bold',...
    'FitBoxToText','off',...
    'EdgeColor','none');
MOVX=annotation(figure1,'textbox',...
    [0.376549048316253 0.582181260378852 0.0885797926002506 0.0414746535996322],...
    'Color',[1 1 1],...
    'String',{'MOVIMIENTO X'},'FontWeight', 'bold',...
    'EdgeColor','none');
Nodo3=annotation(figure1,'textbox',...
    [0.236724743777453 0.32565284256011 0.0563689590067676 0.0414746535996321],...
    'Color',[1 1 1],...
    'String',{'NODO 3:'},'FontWeight', 'bold',...
    'EdgeColor','none');
MOVZ=annotation(figure1,'textbox',...
    [0.220619326500733 0.293394778043983 0.0878477282003987 0.0414746535996321],...
    'Color',[1 1 1],...
    'String',{'MOVIMIENTO Z'},'FontWeight', 'bold',...
    'EdgeColor','none');
Nodo4=annotation(figure1,'textbox',...
    [0.0815270863836026 0.614439324894979 0.0563689590067675 0.0414746535996322],...
    'String',{'NODO 4:'},'Color',[1 1 1],'FontWeight', 'bold',...
    'EdgeColor','none');
Grasp=annotation(figure1,'textbox',...
    [0.0837232796486097 0.58832565362002 0.0505124438079524 0.0414746535996322],...
    'String',{'GRASP'},'Color',[1 1 1],'FontWeight', 'bold',...
    'EdgeColor','none');

% Create ellipse
ellipse_nodo1=annotation(figure1,'ellipse',[0.2 0.733794162826421 0.12 0.23]);
ellipse_nodo2=annotation(figure1,'ellipse',[0.353660322108346 0.45 0.12 0.23]);
ellipse_nodo3=annotation(figure1,'ellipse',...
    [0.202196193265007 0.164669738863287 0.12 0.23]);
ellipse_nodo4=annotation(figure1,'ellipse',[0.05 0.45 0.12 0.23]);

% Creamos el gráfico 
axes1 = uiaxes(figure1,'Position',[800 400 650 300]);

%Definimos los contornos de los objetos
inicio= rectangle(axes1,'Position',[0.1 0.1 0.1 0.1],'FaceColor', 'w');
robot = rectangle(axes1,'Position',[0.1 0.1 0.1 0.1],'FaceColor', 'y');
botella= rectangle(axes1,'Position',[0.1 0.1 0.1 0.1],'FaceColor', 'w');
croissant = rectangle(axes1,'Position',[0.1 0.1 0.1 0.1],'FaceColor', 'w');
refresco = rectangle(axes1,'Position',[0.1 0.1 0.1 0.1],'FaceColor', 'w');
taza = rectangle(axes1,'Position',[0.1 0.1 0.1 0.1],'FaceColor', 'w');
manzana = rectangle(axes1,'Position',[0.1 0.1 0.1 0.1],'FaceColor', 'w');
caja1=rectangle(axes1,'Position',[0.1 0.1 0.1 0.1],'FaceColor', 'w');
caja3=rectangle(axes1,'Position',[0.1 0.1 0.1 0.1],'FaceColor', 'w');
caja5=rectangle(axes1,'Position',[0.1 0.1 0.1 0.1],'FaceColor', 'w');
caja7=rectangle(axes1,'Position',[0.1 0.1 0.1 0.1],'FaceColor', 'w');
caja9=rectangle(axes1,'Position',[0.1 0.1 0.1 0.1],'FaceColor', 'w');

i=30;
j=15;

set(inicio,'Position',[i j 1 1],'FaceColor', 'r');
% set(botella,'Position',[5 21 4 4],'FaceColor', 'w');
% set(croissant,'Position',[25 21 4 4],'FaceColor', 'w');
% set(taza,'Position',[15 12.5 4 4],'FaceColor', 'w');
% set(manzana,'Position',[5 5 4 4],'FaceColor', 'w');
% set(refresco,'Position',[25 5 4 4],'FaceColor', 'w');
% % set(robot,'Position',[i j 1 1],'FaceColor', 'y');
% set(caja1,'Position',[39 20 4 4],'FaceColor', 'g');
% set(caja3,'Position',[52 20 4 4],'FaceColor', 'y');
% set(caja5,'Position',[45 13.5 4 4],'FaceColor', 'm');
% set(caja7,'Position',[39 7 4 4],'FaceColor', 'b');
% set(caja9,'Position',[52 7 4 4],'FaceColor', 'c');

% Definimos limites mesa
xlim(axes1,[0 70]);
ylim(axes1,[0 30]);
grid(axes1,'on');

%ellipse_nodo1.EdgeColor='y';
% Contraccion_modo_1_2.EdgeColor='y';
% ellipse_nodo1.EdgeColor='y';

pause(1)
%Establecemos la comunicación con Noraxon.
%[stream_config, sensor_selection] = noraxon_stream_init('127.0.0.1', '9220');
load ("seleccion.mat");
%Establecemos la comunicación con Unity
tcpipClient = tcpip('127.0.0.1',55002,'NetworkRole','Client');

%Definimos variables
tiempo=0;
unity='0';
command=0;
estado=1;
l=30;
m=15;
numero_flexiones=0;
numero_extensiones=0;
numero_cocontracciones=0;



%Definimos los umbrales de flexión y extensión:

umbral_flexion=40;
umbral_extension=40;


threshold=[umbral_flexion umbral_extension];


gauge_flexion.ScaleColorLimits=[0 umbral_flexion; umbral_flexion 100];
gauge_extension.ScaleColorLimits=[0 umbral_extension; umbral_extension 100];

%BUCLE DE CONTROL
tic
tiempo=0;
while tiempo<=5000000
% 
  data = noraxon_stream_collect(stream_config, 0.2);
%     
    %Leemos los datos de flexión y extensión.
    
    f_amp=mean(data(1).samples(:))
    e_amp=mean(data(2).samples(:))
%     prompt = 'famp? ';
%     x = input(prompt);
%     f_amp = x;
        gauge_flexion.Value = f_amp;
    
%     prompt = 'eamp ';
%     y = input(prompt);
%     e_amp = y;
        gauge_extension.Value=e_amp;
    
    
    if f_amp>threshold(1) && e_amp<threshold(2)
            
            command=1;
    
    elseif f_amp<threshold(1) && e_amp>threshold(2)
            
            command=2;
            
    elseif f_amp>threshold(1) && e_amp>threshold(2) && command_moda==0
            
            command=3;
            
     else
            
            command=0;  
     end
    
    %Guardamos todos los datos de command en un vector.
     for i=1 :1: 3000
    
       salida_comand(i)=command;
    
     end 
 
    %Realizamos la moda del vector para obtener datos más precisos.
    
    command_moda = mode (salida_comand)
    
    if command_moda ==1

        numero_flexiones=numero_flexiones+1;

    elseif command_moda==2

        numero_extensiones=numero_extensiones+1;

    elseif command_moda==3

        numero_cocontracciones= numero_cocontracciones+1;
  
        

    end

    


    switch estado
    
        
        %Movimiento en y
        case 1
            
            ellipse_nodo1.EdgeColor='y';
            ellipse_nodo4.EdgeColor='k';
    
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
                 
                case 1 %Flexion
                    Extension_nodo1.EdgeColor='k';
                    Flexion_nodo1.EdgeColor='y';
                    drawnow 
                    unity='1';
                    set(tcpipClient,'Timeout',30);
                    fopen(tcpipClient);
                    fwrite(tcpipClient,unity);
                    fclose(tcpipClient);
                
                case 2 %Extension
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
        
        %Movimiento en x
        case 2
           
          switch command_moda
                case 0
                    Extension_nodo2.EdgeColor='k';
                    Flexion_nodo2.EdgeColor='k';
                    drawnow
                    unity='0';
                    set(tcpipClient,'Timeout',30);
                    fopen(tcpipClient);
                    fwrite(tcpipClient,unity);
                    fclose(tcpipClient);
                 
                case 1
                    Extension_nodo2.EdgeColor='k';
                    Flexion_nodo2.EdgeColor='y';
                    l=l-0.3;
                    robot = rectangle(axes1,'Position',[0.1 0.1 0.5 0.5],'FaceColor', 'y');
                    set(robot,'Position',[l m 0.5 0.5],'FaceColor', 'y');
                    drawnow 
                    unity='3';
                    set(tcpipClient,'Timeout',30);
                    fopen(tcpipClient);
                    fwrite(tcpipClient,unity);
                    fclose(tcpipClient);
                
                case 2
                   Extension_nodo2.EdgeColor='y';
                   Flexion_nodo2.EdgeColor='k';
                   l=l+0.3;
                   robot = rectangle(axes1,'Position',[0.1 0.1 0.5 0.5],'FaceColor', 'y');
                   set(robot,'Position',[l m 0.5 0.5],'FaceColor', 'y');
                    drawnow 
                    unity='4';
                    set(tcpipClient,'Timeout',30);
                    fopen(tcpipClient);
                    fwrite(tcpipClient,unity);
                    fclose(tcpipClient);
        
                case 3
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
                    estado=3;
    
           end
         %Movimiento en z
         case 3
            
      
          switch command_moda
            case 0
                Extension_nodo3.EdgeColor='k';
                Flexion_nodo3.EdgeColor='k';
                drawnow
                unity='0';
                set(tcpipClient,'Timeout',30);
                fopen(tcpipClient);
                fwrite(tcpipClient,unity);
                fclose(tcpipClient);
             
            case 1
               Extension_nodo3.EdgeColor='k';
               Flexion_nodo3.EdgeColor='y';
               m=m+0.3;
               robot = rectangle(axes1,'Position',[0.1 0.1 0.5 0.5],'FaceColor', 'y');
               set(robot,'Position',[l m 0.5 0.5],'FaceColor', 'y');
                drawnow 
                unity='5';
                set(tcpipClient,'Timeout',30);
                fopen(tcpipClient);
                fwrite(tcpipClient,unity);
                fclose(tcpipClient);
            
            case 2
                Extension_nodo3.EdgeColor='y';
                Flexion_nodo3.EdgeColor='k';
                m=m-0.3;
                robot = rectangle(axes1,'Position',[0.1 0.1 0.5 0.5],'FaceColor', 'y');
                set(robot,'Position',[l m 0.5 0.5],'FaceColor', 'y');
                drawnow 
                unity='6';
                set(tcpipClient,'Timeout',30);
                fopen(tcpipClient);
                fwrite(tcpipClient,unity);
                fclose(tcpipClient);
    
            case 3
                Extension_nodo3.EdgeColor='k';
                Flexion_nodo3.EdgeColor='k';
                Contraccion_modo_3_4.EdgeColor='y';
                ellipse_nodo3.EdgeColor='k';
                unity='0';
                set(tcpipClient,'Timeout',30);
                fopen(tcpipClient);
                fwrite(tcpipClient,unity);
                fclose(tcpipClient);
                pause(1);
                salida_comand=[];
                Contraccion_modo_3_4.EdgeColor='k';
                ellipse_nodo4.EdgeColor='y';
                pause(0.01)
                estado = 4;
    
          end
         
         %Movimiento agarre
        case 4
            
    
          switch command_moda
            case 0
                Extension_nodo4.EdgeColor='k';
                Flexion_nodo4.EdgeColor='k';
                drawnow
                unity='0';
                set(tcpipClient,'Timeout',30);
                fopen(tcpipClient);
                fwrite(tcpipClient,unity);
                fclose(tcpipClient);
             
            case 1
                Extension_nodo4.EdgeColor='k';
                Flexion_nodo4.EdgeColor='y';
                drawnow 
                unity='7';
                set(tcpipClient,'Timeout',30);
                fopen(tcpipClient);
                fwrite(tcpipClient,unity);
                fclose(tcpipClient);
            
            case 2
                Extension_nodo4.EdgeColor='y';
                Flexion_nodo4.EdgeColor='k';
                drawnow 
                unity='8';
                set(tcpipClient,'Timeout',30);
                fopen(tcpipClient);
                fwrite(tcpipClient,unity);
                fclose(tcpipClient);
    
            case 3
                Extension_nodo4.EdgeColor='k';
                Flexion_nodo4.EdgeColor='k';
                Contraccion_modo_4_1.EdgeColor='y';
                ellipse_nodo4.EdgeColor='k';
                 
                unity='0';
                    set(tcpipClient,'Timeout',30);
                    fopen(tcpipClient);
                    fwrite(tcpipClient,unity);
                    fclose(tcpipClient);
                pause(1);
                salida_comand=[];
                Contraccion_modo_4_1.EdgeColor='k';
                ellipse_nodo1.EdgeColor='y';
                pause(0.01)
                estado = 1;
            
          end
          
       otherwise
            
        estado=1;
        
    end
    
    

    tiempo = toc;
    

end
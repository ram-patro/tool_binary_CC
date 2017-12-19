function varargout = tool(varargin)
% TOOL MATLAB code for tool.fig
%      TOOL, by itself, creates a new TOOL or raises the existing
%      singleton*.
%
%      H = TOOL returns the handle to a new TOOL or the handle to
%      the existing singleton*.
%
%      TOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TOOL.M with the given input arguments.
%
%      TOOL('Property','Value',...) creates a new TOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tool

% Last Modified by GUIDE v2.5 02-Nov-2017 08:39:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tool_OpeningFcn, ...
                   'gui_OutputFcn',  @tool_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before tool is made visible.
function tool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tool (see VARARGIN)

% Choose default command line output for tool
handles.output = hObject;

% Update handles structure
handles.st=0;
handles.clf=0;
guidata(hObject, handles);

% UIWAIT makes tool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.fr_no=ceil(get(hObject,'Value')*handles.features);
set(handles.text10, 'String',num2str(handles.fr_no));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
guidata(hObject,handles);

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
contents = cellstr(get(hObject,'String'));
handles.data=contents{get(hObject,'Value')};
if(strcmp(handles.data,'australian'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_australian_data('australian');
elseif(strcmp(handles.data,'bcancer'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_bcancer_data('breast-cancer');
elseif(strcmp(handles.data,'BCancer D'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_wdbc();
elseif(strcmp(handles.data,'BCancer O'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_breastcancerwisconsin();
elseif(strcmp(handles.data,'BCancer P'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_wpbc();
elseif(strcmp(handles.data,'Clean1'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_clean1();
elseif(strcmp(handles.data,'Clean2'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_clean2();
elseif(strcmp(handles.data,'diabetes'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_diabetes_data('diabetes');
elseif(strcmp(handles.data,'eigththr'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_eighthr();
elseif(strcmp(handles.data,'glass'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_glass();
elseif(strcmp(handles.data,'Hvely wnoise'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_HillValleywithnoise();
elseif(strcmp(handles.data,'Hvely wonoise'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_HillValleywithoutnoiseTraining();
elseif(strcmp(handles.data,'ionoshpere'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_ionosphere();
elseif(strcmp(handles.data,'onehr'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_onehr();
elseif(strcmp(handles.data,'Parkinsons'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_parkinsons();
elseif(strcmp(handles.data,'Sonar'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_sonar();
elseif(strcmp(handles.data,'Tfusion blood'))
    [handles.total_data,handles.total_data__,handles.total_class,handles.features]=load_data_transfusion();
end
set(handles.text27, 'String',num2str(handles.features));
set(handles.text13, 'String',num2str(numel(find(handles.total_class==1))));
set(handles.text14, 'String',num2str(numel(find(handles.total_class==2))));
set(handles.text17, 'String','--');
set(handles.text18, 'String','--');
set(handles.text23, 'String','--');
set(handles.text24, 'String','--');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject,handles);


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
contents = cellstr(get(hObject,'String'));
handles.per=str2double(contents{get(hObject,'Value')});
[handles.train_data,handles.train_data_n,handles.train_class,handles.test_data,handles.test_data_n,handles.test_class,dim]=divide_data(handles.total_data_,handles.total_data_n,handles.total_class,handles.per);
set(handles.text17, 'String',num2str(dim(1)));
set(handles.text18, 'String',num2str(dim(2)));
set(handles.text23, 'String',num2str(dim(3)));
set(handles.text24, 'String',num2str(dim(4)));
set(handles.text29, 'String','--');
set(handles.text30, 'String','--');
set(handles.text31, 'String','--');
set(handles.text2, 'String','--');
set(handles.text4, 'String','--');
set(handles.text6, 'String','--');
set(handles.text8, 'String','--');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject,handles);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure,plotconfusion(convert_labels_binary_vec(handles.test_class,2),convert_labels_binary_vec(handles.predict_class,2));
guidata(hObject,handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure,plotroc(convert_labels_binary_vec(handles.test_class,2),convert_labels_binary_vec(handles.predict_class,2));
guidata(hObject,handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(strcmp(handles.classifier,'CC'))
    image_feature_disp(handles.Mdl);
else
    disp('This can be viewed only for FUZZY Classifier');
end
guidata(hObject,handles);


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3
contents = cellstr(get(hObject,'String'));
handles.classifier=contents{get(hObject,'Value')};
set(handles.text40, 'String','--');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject,handles);

% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4
contents = cellstr(get(hObject,'String'));
handles.fr_name=contents{get(hObject,'Value')};
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject,handles);

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
handles.st=get(hObject,'Value');
guidata(hObject,handles);


% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
guidata(hObject,handles);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[handles.filename,pathname] = uigetfile({'*.eps';'*.pdf'},'File Selector');
eps2pdf(strcat(pathname, handles.filename),'C:\Program Files (x86)\gs\gs9.18\bin\gswin32c.exe',0);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function checkbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
guidata(hObject,handles);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(handles.st==1)
    disp('reduction start');
    [handles.total_data_,~]=compute_mapping(handles.total_data,handles.fr_name,handles.fr_no);
    [handles.total_data_n,~]=compute_mapping(handles.total_data__,handles.fr_name,handles.fr_no);
    handles.total_data_n=normalize_data(handles.total_data_n);
    disp('reduction complete');
    set(handles.text38, 'String',num2str(size(handles.total_data_,2)));
else
    disp('no reduction');
    handles.total_data_=handles.total_data;
    handles.total_data_n=handles.total_data__;
    set(handles.text38, 'String','no');
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function pushbutton5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
guidata(hObject,handles);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('training starts...');
if(strcmp(handles.classifier,'KNN'))%no normalization
    handles.Mdl=fitcknn([handles.train_data(1).mat;handles.train_data(2).mat],handles.train_class,'NumNeighbors',1);
elseif(strcmp(handles.classifier,'NN'))
    handles.Mdl=train(patternnet(10),[handles.train_data(1).mat;handles.train_data(2).mat]',convert_labels_binary_vec(handles.train_class',2));
elseif(strcmp(handles.classifier,'SVM-linear'))%no normalization
    handles.Mdl=fitcsvm([handles.train_data(1).mat;handles.train_data(2).mat],handles.train_class);
elseif(strcmp(handles.classifier,'SVM-rbf'))%no normalization
    handles.Mdl=fitcsvm([handles.train_data(1).mat;handles.train_data(2).mat],handles.train_class,'KernelFunction','rbf');
elseif(strcmp(handles.classifier,'DTree'))%no normalization
    handles.Mdl=fitctree([handles.train_data(1).mat;handles.train_data(2).mat],handles.train_class);
elseif(strcmp(handles.classifier,'Naivebayes'))%no normalization
    handles.Mdl=fitcnb([handles.train_data(1).mat;handles.train_data(2).mat],handles.train_class);
elseif(strcmp(handles.classifier,'RForest'))%no normalization
    opts= struct;
    opts.depth= 9;
    opts.numTrees= 100;
    opts.numSplits= 5;
    opts.verbose= true;
    opts.classifierID= 2; % weak learners to use. Can be an array for mix of weak learners too
    handles.Mdl=forestTrain([handles.train_data(1).mat;handles.train_data(2).mat],handles.train_class,opts);
elseif(strcmp(handles.classifier,'CC'))%normalization
    [~,handles.Mdl]=binary_cond(handles.train_data_n);  
end
disp('training ends...');
guidata(hObject,handles);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('testing starts...');
if(strcmp(handles.classifier,'KNN'))
    [handles.predict_class,~]=predict(handles.Mdl,handles.test_data);
elseif(strcmp(handles.classifier,'NN'))
    bin=double(handles.Mdl(handles.test_data')==max(handles.Mdl(handles.test_data')));
    handles.predict_class=[];
    for i=1:size(bin,2)
        if(sum(bin(:,i)==[1;0])==0)
            handles.predict_class(i,1)=2;
        else
            handles.predict_class(i,1)=1;
        end
    end
elseif(strcmp(handles.classifier,'SVM-linear'))
    [handles.predict_class,~]=predict(handles.Mdl,handles.test_data);
elseif(strcmp(handles.classifier,'SVM-rbf'))
    [handles.predict_class,~]=predict(handles.Mdl,handles.test_data);
elseif(strcmp(handles.classifier,'Naivebayes'))
    [handles.predict_class,~]=predict(handles.Mdl,handles.test_data);
elseif(strcmp(handles.classifier,'DTree'))
    [handles.predict_class,~]=predict(handles.Mdl,handles.test_data);
elseif(strcmp(handles.classifier,'RForest'))
    [handles.predict_class]=forestTest(handles.Mdl,handles.test_data);handles.predict_class=handles.predict_class';
elseif(strcmp(handles.classifier,'CC'))
    [rank_dev,rank_modp,rank_mod]=prepare_matrix_classification(handles.Mdl,handles.test_data_n);
    [handles.predict_class,cnt]=update_fuzzy_output(rank_dev,rank_modp,rank_mod,handles.Mdl);
    set(handles.text40, 'String',num2str(cnt));
end
EVAL=Evaluate(handles.test_class,handles.predict_class);
set(handles.text2,'String',num2str(EVAL(1)));%accuracy
set(handles.text6,'String',num2str(EVAL(2)));%sensitivity
set(handles.text4,'String',num2str(EVAL(3)));%specificity
set(handles.text29,'String',num2str(EVAL(4)));%precision
set(handles.text30,'String',num2str(EVAL(5)));%recall
set(handles.text8,'String',num2str(EVAL(6)));%fmeasure
set(handles.text31,'String',num2str(EVAL(7)));%gmean
disp('testing ends...');
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function pushbutton6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function text26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function text37_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
guidata(hObject,handles);

% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.ft1=floor(get(hObject,'Value')*size(handles.total_data_n,2))+1;
set(handles.text41, 'String',num2str(handles.ft1));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
guidata(hObject,handles);


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.ft2=floor(get(hObject,'Value')*size(handles.total_data_n,2))+1;
set(handles.text42, 'String',num2str(handles.ft2));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
guidata(hObject,handles);

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
guidata(hObject,handles);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

guidata(hObject,handles);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure,
if(strcmp(handles.classifier,'CC')) 
    subplot(1,2,1);hist(handles.total_data_n(:,handles.ft1));
    xlim([min(handles.total_data_n(:,handles.ft1)) max(handles.total_data_n(:,handles.ft1))]);
    title(strcat('Normalised feature :: ',num2str(handles.ft1)));
    subplot(1,2,2);hist(handles.total_data_n(:,handles.ft2));
    xlim([min(handles.total_data_n(:,handles.ft2)) max(handles.total_data_n(:,handles.ft2))]);
    title(strcat('Normalised feature :: ',num2str(handles.ft2)));
else
    subplot(1,2,1);hist(handles.total_data(:,handles.ft1));
    xlim([min(handles.total_data(:,handles.ft1)) max(handles.total_data(:,handles.ft1))]);
    title(strcat('Original feature :: ',num2str(handles.ft1)));
    subplot(1,2,2);hist(handles.total_data(:,handles.ft2));
    xlim([min(handles.total_data(:,handles.ft2)) max(handles.total_data(:,handles.ft2))]);
    title(strcat('Original feature :: ',num2str(handles.ft2)));
end
guidata(hObject,handles);


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
handles.clf=get(hObject,'Value');
guidata(hObject,handles);


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%handles.ft1=floor(get(hObject,'Value')*size(handles.total_data_n,2))+1;
%set(handles.text45, 'String',num2str(handles.ft1));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
guidata(hObject,handles);

% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%handles.ft2=floor(get(hObject,'Value')*size(handles.total_data_n,2))+1;
%set(handles.text46, 'String',num2str(handles.ft2));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
guidata(hObject,handles);

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure(1),
hold on
% locs1=find(handles.total_class==1);
% locs2=find(handles.total_class==2);
% if(strcmp(handles.classifier,'CC'))
%     plot(handles.total_data_n(locs1,handles.ft1),handles.total_data_n(locs1,handles.ft2),'ob');
%     plot(handles.total_data_n(locs2,handles.ft1),handles.total_data_n(locs2,handles.ft2),'og');
%     xlim([0 1]);ylim([0 1]);
%     xlabel(strcat('Normalised feature :: ',num2str(handles.ft1)));
%     ylabel(strcat('Normalised feature :: ',num2str(handles.ft2)));
% else
%     plot(handles.total_data(locs1,handles.ft1),handles.total_data(locs1,handles.ft2),'ob');
%     plot(handles.total_data(locs2,handles.ft1),handles.total_data(locs2,handles.ft2),'og');
%     xlim([min(handles.total_data(:,handles.ft1)) max(handles.total_data(:,handles.ft1))]);ylim([min(handles.total_data(:,handles.ft2)) max(handles.total_data(:,handles.ft2))]);
%     xlabel(strcat('Original feature :: ',num2str(handles.ft1)));
%     ylabel(strcat('Original feature :: ',num2str(handles.ft2)));
% end
locs1=find(handles.train_class==1);
locs2=find(handles.train_class==2);
if(strcmp(handles.classifier,'CC'))
    handles.tr_data_n=[handles.train_data_n(1).mat;handles.train_data_n(2).mat];
    plot(handles.tr_data_n(locs1,handles.ft1),handles.tr_data_n(locs1,handles.ft2),'ob','Marker','o','MarkerFaceColor','b','MarkerSize',8);
    plot(handles.tr_data_n(locs2,handles.ft1),handles.tr_data_n(locs2,handles.ft2),'or','Marker','o','MarkerFaceColor','r','MarkerSize',8);
else
    handles.tr_data=[handles.train_data(1).mat;handles.train_data(2).mat];
    plot(handles.tr_data(locs1,handles.ft1),handles.tr_data(locs1,handles.ft2),'ob','Marker','o','MarkerFaceColor','b','MarkerSize',8);
    plot(handles.tr_data(locs2,handles.ft1),handles.tr_data(locs2,handles.ft2),'or','Marker','o','MarkerFaceColor','r','MarkerSize',8);
end
locs1=find(handles.test_class==1);
locs2=find(handles.test_class==2);
if(strcmp(handles.classifier,'CC'))
    plot(handles.test_data_n(locs1,handles.ft1),handles.test_data_n(locs1,handles.ft2),'ob','Marker','o','MarkerFaceColor','b','MarkerSize',8,'MarkerEdgeColor','k','LineWidth',1.5);
    plot(handles.test_data_n(locs2,handles.ft1),handles.test_data_n(locs2,handles.ft2),'or','Marker','o','MarkerFaceColor','r','MarkerSize',8,'MarkerEdgeColor','k','LineWidth',1.5);
    if(handles.clf==1)
        locs=find(handles.predict_class~=handles.test_class);
        plot(handles.test_data_n(locs,handles.ft1),handles.test_data_n(locs,handles.ft2),'xg','Marker','x','MarkerSize',8,'LineWidth',1.5);
    else
        ;;
    end
    xlabel(strcat('Normalised feature :: ',num2str(handles.ft1)));
    ylabel(strcat('Normalised feature :: ',num2str(handles.ft2)));
else
    plot(handles.test_data(locs1,handles.ft1),handles.test_data(locs1,handles.ft2),'ob','Marker','o','MarkerFaceColor','b','MarkerSize',8,'MarkerEdgeColor','k','LineWidth',1.5);
    plot(handles.test_data(locs2,handles.ft1),handles.test_data(locs2,handles.ft2),'or','Marker','o','MarkerFaceColor','r','MarkerSize',8,'MarkerEdgeColor','k','LineWidth',1.5);
    if(handles.clf==1)
        locs=find(handles.predict_class~=handles.test_class);
        plot(handles.test_data(locs,handles.ft1),handles.test_data(locs,handles.ft2),'xg','Marker','x','MarkerSize',8,'LineWidth',1.5);
    else
        ;;
    end
    xlabel(strcat('Original feature :: ',num2str(handles.ft1)));
    ylabel(strcat('Original feature :: ',num2str(handles.ft2)));
end
%title(strcat('classifier :: ',handles.classifier));
if(handles.clf==1)
    legend('Train class 1','Train class 2','Test class 1','Test class 2','Miss classified');
else
    legend('Train class 1','Train class 2','Test class 1','Test class 2');
end
guidata(hObject,handles);

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% figure,
% if(strcmp(handles.classifier,'CC')) 
%     subplot(1,2,1);hist(handles.total_data_n(:,handles.ft1));
%     xlim([min(handles.total_data_n(:,handles.ft1)) max(handles.total_data_n(:,handles.ft1))]);
%     title(strcat('Normalised feature :: ',num2str(handles.ft1)));
%     subplot(1,2,2);hist(handles.total_data_n(:,handles.ft2));
%     xlim([min(handles.total_data_n(:,handles.ft2)) max(handles.total_data_n(:,handles.ft2))]);
%     title(strcat('Normalised feature :: ',num2str(handles.ft2)));
% else
%     subplot(1,2,1);hist(handles.total_data(:,handles.ft1));
%     xlim([min(handles.total_data(:,handles.ft1)) max(handles.total_data(:,handles.ft1))]);
%     title(strcat('Original feature :: ',num2str(handles.ft1)));
%     subplot(1,2,2);hist(handles.total_data(:,handles.ft2));
%     xlim([min(handles.total_data(:,handles.ft2)) max(handles.total_data(:,handles.ft2))]);
%     title(strcat('Original feature :: ',num2str(handles.ft2)));
% end
guidata(hObject,handles);

% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%handles.ft1=floor(get(hObject,'Value')*size(handles.total_data_n,2))+1;
%set(handles.text43, 'String',num2str(handles.ft1));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
guidata(hObject,handles);

% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%handles.ft2=floor(get(hObject,'Value')*size(handles.total_data_n,2))+1;
%set(handles.text44, 'String',num2str(handles.ft2));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
guidata(hObject,handles);

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%figure(1),
%hold on

title(strcat('classifier :: ',handles.classifier));
legend('class 1','class 2','miss classified');
guidata(hObject,handles);

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% figure,
% if(strcmp(handles.classifier,'CC')) 
%     handles.tr_data_n=[handles.train_data_n(1).mat;handles.train_data_n(2).mat];
%     subplot(1,2,1);hist(handles.tr_data_n(:,handles.ft1));
%     xlim([min(handles.tr_data_n(:,handles.ft1)) max(handles.tr_data_n(:,handles.ft1))]);
%     title(strcat('Normalised feature :: ',num2str(handles.ft1)));
%     subplot(1,2,2);hist(handles.tr_data_n(:,handles.ft2));
%     xlim([min(handles.total_data_n(:,handles.ft2)) max(handles.total_data_n(:,handles.ft2))]);
%     title(strcat('Normalised feature :: ',num2str(handles.ft2)));
% else
%     handles.tr_data=[handles.train_data(1).mat;handles.train_data(2).mat];
%     subplot(1,2,1);hist(handles.tr_data(:,handles.ft1));
%     xlim([min(handles.total_data(:,handles.ft1)) max(handles.total_data(:,handles.ft1))]);
%     title(strcat('Original feature :: ',num2str(handles.ft1)));
%     subplot(1,2,2);hist(handles.test_data(:,handles.ft2));
%     xlim([min(handles.total_data(:,handles.ft2)) max(handles.total_data(:,handles.ft2))]);
%     title(strcat('Original feature :: ',num2str(handles.ft2)));
% end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function pushbutton10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
guidata(hObject,handles);

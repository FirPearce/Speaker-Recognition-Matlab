function varargout = untitled1(varargin)
% UNTITLED1 M-file for untitled1.fig
%      UNTITLED1, by itself, creates a new UNTITLED1 or raises the existing
%      singleton*.
%
%      H = UNTITLED1 returns the handle to a new UNTITLED1 or the handle to
%      the existing singleton*.
%
%      UNTITLED1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED1.M with the given input arguments.
%
%      UNTITLED1('Property','Value',...) creates a new UNTITLED1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled1

% Last Modified by GUIDE v2.5 09-Jun-2021 18:27:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled1_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled1_OutputFcn, ...
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


% --- Executes just before untitled1 is made visible.
function untitled1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled1 (see VARARGIN)

% Choose default command line output for untitled1
handles.output = hObject;
handles.nilai = 0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in coba.
function coba_Callback(hObject, eventdata, handles)
% hObject    handle to coba (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
form = guidata(gcbo);
fs = 16000;
y = wavrecord(fs, fs, 'double');
wavplay(y,fs);
[namafile,direktori] = uiputfile('*.wav','Save sound','s1.wav');
if isequal(namafile,0) || isequal(direktori,0)
       return   % or whatever other action if 'CANCEL'
else
    nwavfile=fullfile(direktori, namafile);
    wavwrite(y,fs,nwavfile);
end


% --- Executes on button press in proses1.
function proses1_Callback(hObject, eventdata, handles)
% hObject    handle to proses1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s1;
global s2;
global s3;
global fs1;
global fs2;
global fs3;
[s1 fs1] = wavread('train\s1.wav');
[s2 fs2] = wavread('train\s2.wav');
[s3 fs3] = wavread('train\s3.wav');
t = 0:1/fs1:(length(s1) - 1)/fs1;
axes(handles.axes1);
plot(t, s1), axis([0, (length(s1) - 1)/fs1 -0.4 0.5]);
axes(handles.axes1);
title('Plot of signal s1.wav');
xlabel('Time [s]');
ylabel('Amplitude (normalized)')

% --- Executes on button press in proses2.
function proses2_Callback(hObject, eventdata, handles)
% hObject    handle to proses2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s1;
global fs1;
global tm;
global t;
global frames;
M = 100;
N = 256;
frames = blockFrames(s1, fs1, M, N);
t = N / 2;
tm = length(s1) / fs1;
%subplot(121);
axes(handles.axes2);
imagesc([0 tm], [0 fs1/2], abs(frames(1:t, :)).^2), axis xy;
axes(handles.axes2);
title('Power Spectrum (M = 100, N = 256)');
xlabel('Time [s]');
ylabel('Frequency [Hz]');
colorbar;

axes(handles.axes3);
imagesc([0 tm], [0 fs1/2], 20 * log10(abs(frames(1:t, :)).^2)), axis xy;
axes(handles.axes3);
title('Logarithmic Power Spectrum (M = 100, N = 256)');
xlabel('Time [s]');
ylabel('Frequency [Hz]');
colorbar;
%D=get(gcf,'Position');
%set(gcf,'Position',round([D(1)*.5 D(2)*.5 D(3)*2 D(4)*1.3]))

function hasil_Callback(hObject, eventdata, handles)
% hObject    handle to hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hasil as text
%        str2double(get(hObject,'String')) returns contents of hasil as a double


% --- Executes during object creation, after setting all properties.
function hasil_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in proses3.
function proses3_Callback(hObject, eventdata, handles)
% hObject    handle to proses3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%subplot(122);
global s1;
global t;
global fs1;
global tm;
global frames;
lN = [128 256 512];
u=220;
for i = 1:length(lN)
N = lN(i);
M = round(N / 3);
frames = blockFrames(s1, fs1, M, N);
t = N / 2;
 temp = size(frames);
 nbframes = temp(2);
 u=u+1;
 %subplot(u)
 axes(handles.axes4);
 imagesc([0 tm], [0 fs1/2], 20 * log10(abs(frames(1:t, :)).^2)), axis xy;
 title(sprintf('Power Spectrum (M = %i, N = %i, frames = %i)', M, N, nbframes));
 xlabel('Time [s]');
 ylabel('Frequency [Hz]');
 colorbar
 pause(2);
end
%D=get(gcf,'Position');
%set(gcf,'Position',round([D(1)*.5 D(2)*.5 D(3)*1.5 D(4)*1.5]))



% --- Executes on button press in proses4.
function proses4_Callback(hObject, eventdata, handles)
% hObject    handle to proses4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fs1;
axes(handles.axes5);
plot(linspace(0, (fs1/2), 129), (melfb(20, 256, fs1))');
title('Mel-Spaced Filterbank');
xlabel('Frequency [Hz]');


% --- Executes on button press in proses5.
function proses5_Callback(hObject, eventdata, handles)
% hObject    handle to proses5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global frames;
global fs1;
global s1;
M = 100;
N = 256;
frames = blockFrames(s1, fs1, M, N);
n2 = 1 + floor(N / 2);
m = melfb(20, N, fs1);
z = m * abs(frames(1:n2, :)).^2;
t = N / 2;
tm = length(s1) / fs1;
%subplot(121)
axes(handles.axes6);
imagesc([0 tm], [0 fs1/2], abs(frames(1:n2, :)).^2), axis xy;
title('Power Spectrum unmodified');
xlabel('Time [s]');
ylabel('Frequency [Hz]');
colorbar;
%subplot(122)
axes(handles.axes7);
imagesc([0 tm], [0 20], z), axis xy;
title('Power Spectrum modified through Mel Cepstrum filter');
xlabel('Time [s]');
ylabel('Number of Filter in Filter Bank');
colorbar;
%D=get(gcf,'Position');
%set(gcf,'Position',[0 D(2) D(3)*2 D(4)])

% --- Executes on button press in proses6.
function proses6_Callback(hObject, eventdata, handles)
% hObject    handle to proses6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fs1;
global s1;
global s2;
global fs2;
global s3;
global fs3;
global c1;
global c2;
global c3;
axes(handles.axes8);
c1 = mfcc(s1, fs1);
c2 = mfcc(s2, fs2);
c3 = mfcc(s3, fs3);
plot(c1(5, :), c1(6, :), 'xk');
hold on;
plot(c2(5, :), c2(6, :), 'xb');
plot(c3(5, :), c3(6, :), 'xr');
xlabel('5th Dimension');
ylabel('6th Dimension');
legend('Firly', 'Raka','Tito');
title('2D plot of accoustic vectors');


% --- Executes on button press in proses8.
function proses8_Callback(hObject, eventdata, handles)
% hObject    handle to proses8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c1;
global c2;
global c3;
d1 = vqlbg(c1,16);
d2 = vqlbg(c2,16);
d3 = vqlbg(c3,16);
axes(handles.axes10);
plot(c1(5, :), c1(6, :), 'xr')
hold on
plot(d1(5, :), d1(6, :), 'vr')
plot(c2(5, :), c2(6, :), 'xb')
plot(d2(5, :), d2(6, :), '+b')
plot(c3(5, :), c3(6, :), 'xk')
plot(d3(5, :), d3(6, :), 'ok')
xlabel('5th Dimension');
ylabel('6th Dimension');
legend('Firly', 'Centroid 1', 'Raka', 'Centroid 2','Tito', 'Centroid 3');
title('2D plot of accoustic vectors');


% --- Executes on button press in prosesfinal.
function prosesfinal_Callback(hObject, eventdata, handles)
% hObject    handle to prosesfinal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.hasil,'Max',length(15));
code = train('train\', 3);
jadi = '';
nilai = '';
for k = 1:3 % read test sound file of each speaker
file = sprintf('%ss%d.wav','test\',k);
[s, fs] = wavread(file);

v = mfcc(s, fs); % Compute MFCC's

distmin = inf;
k1 = 0;

for l = 1:length(code) % each trained codebook, compute distortion
d = disteu(v, code{l});
dist = sum(min(d,[],2)) / size(d,1);

if dist < distmin
distmin = dist;
k1 = l;
end
end
msg = sprintf('Speaker %d matches with speaker %d \n', k, k1);
jadi = [nilai, msg];
nilai = jadi;
end
set(handles.hasil,'String',jadi);


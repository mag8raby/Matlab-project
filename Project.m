function varargout = Project(varargin)
% PROJECT MATLAB code for Project.fig
%      PROJECT, by itself, creates a new PROJECT or raises the existing
%      singleton*.
%
%      H = PROJECT returns the handle to a new PROJECT or the handle to
%      the existing singleton*.
%
%      PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT.M with the given input arguments.
%
%      PROJECT('Property','Value',...) creates a new PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Project

% Last Modified by GUIDE v2.5 25-Dec-2024 00:55:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Project_OpeningFcn, ...
                   'gui_OutputFcn',  @Project_OutputFcn, ...
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


% --- Executes just before Project is made visible.
function Project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Project (see VARARGIN)

% Choose default command line output for Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Gray_To_Binary.
function Gray_To_Binary_Callback(hObject, eventdata, handles)
% hObject    handle to Gray_To_Binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
A = graytobinary(X,128);
X=A;
axes(handles.axes2);
imshow(X);


% --- Executes on button press in RGB_To_Binary.
function RGB_To_Binary_Callback(hObject, eventdata, handles)
% hObject    handle to RGB_To_Binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
axes(handles.axes2);
rgbtobinary(X,3,128);



% --- Executes on button press in RGB_To_Gray.
function RGB_To_Gray_Callback(hObject, eventdata, handles)
% hObject    handle to RGB_To_Gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
A = rgbtogray(X,3);
X=A;
axes(handles.axes2);
imshow(X);


% --- Executes on button press in Hisotgram.
function Hisotgram_Callback(hObject, eventdata, handles)
% hObject    handle to Hisotgram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure wi   th handles and user data (see GUIDATA)
global X ;
axes(handles.axes2);
Histo(X);

% --- Executes on button press in Upload.
function Upload_Callback(hObject, eventdata, handles)
% hObject    handle to Upload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X;
X=uigetfile('*.*');
X=imread(X);
axes(handles.axes1);
imshow(X);



% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Clear axes (if you have a plot)
cla(handles.axes1, 'reset'); % Clear the axes named 'axes1'
guidata(hObject, handles);% Update handles if needed



% --- Executes on button press in Download.
function Download_Callback(hObject, eventdata, handles)
   % Check if 'axes2' contains an image
    axesHandle = handles.axes2; % Reference to axes2
    imageObj = findobj(axesHandle, 'Type', 'image'); % Find image object in axes2

    if ~isempty(imageObj)
        try
            % Extract image data
            imageData = get(imageObj, 'CData');
            
            % Open file save dialog
            [fileName, filePath] = uiputfile({'*.png'; '*.jpg'; '*.bmp'; '*.tif'}, 'Save Image As');
            
            % Check if the user selected a file
            if fileName
                % Construct full file path
                fullFileName = fullfile(filePath, fileName);
                
                % Save the image
                imwrite(imageData, fullFileName);
                disp(['Image saved to: ', fullFileName]);
            else
                disp('Image save canceled.');
            end
        catch ME
            % Handle any unexpected errors
            errordlg(['An error occurred: ', ME.message], 'Error');
        end
    else
        % Handle case where no image is found in axes2
        errordlg('No image found in axes2 to save. Please load or generate an image first.', 'Error');
    end


    
% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Laplacian.
function Laplacian_Callback(hObject, eventdata, handles)
% hObject    handle to Laplacian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
axes(handles.axes2);
sharpning(X);




% --- Executes on button press in HighBoost.
function HighBoost_Callback(hObject, eventdata, handles)
% hObject    handle to HighBoost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.Horizontal_S, 'Value') == 1
    choice = 'horizontal' ;  % H
elseif get(handles.Vertical_S, 'Value') == 1
    choice = 'vertical';  % V
elseif get(handles.Diagonal_Right_S, 'Value') == 1
    choice = 'diagonal_right';  % DR
elseif get(handles.Diagonal_Left_S, 'Value') == 1
    choice = 'diagonal_left';  % DL
elseif get(handles.All, 'Value') == 1
    choice = 'all';  % all
else
    errordlg('Please select a highboost direcion', 'Error');
    return;
end

global X

% Get the boost factor value from the input field (edit_boost_factor)
boost_factor = str2double(get(handles.edit_boost_factor, 'String'));

% Check if the input is a valid number
if isnan(boost_factor) || boost_factor <= 0
    % If invalid, show an error message and return
    errordlg('Please enter a valid boost factor (positive number)', 'Invalid Input');
    return;
end

% Perform the high-boost filtering operation by calling the custom function 'highBoostFilter'
sharpened_image = highBoostFilter(X, boost_factor,choice);

% Display the sharpened image in axes2
axes(handles.axes2);
imshow(sharpened_image);



% --- Executes on button press in Unsharp.
function Unsharp_Callback(hObject, eventdata, handles)
% hObject    handle to Unsharp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
axes(handles.axes2);
unsharpFilter(X);


% --- Executes on button press in Simplefide.
function Simplefide_Callback(hObject, eventdata, handles)
% hObject    handle to Simplefide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
axes(handles.axes2);
sharpning2(X);



function edit_boost_factor_Callback(hObject, eventdata, handles)
% hObject    handle to edit_boost_factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_boost_factor as text
%        str2double(get(hObject,'String')) returns contents of edit_boost_factor as a double


% --- Executes during object creation, after setting all properties.
function edit_boost_factor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_boost_factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Sobel.
function Sobel_Callback(hObject, eventdata, handles)
% hObject    handle to Sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.radio_h, 'Value') == 1
    choice = 'h';  % Horizontal Sobel filter
elseif get(handles.radio_v, 'Value') == 1
    choice = 'v';  % Vertical Sobel filter
elseif get(handles.radio_rd, 'Value') == 1
    choice = 'rd';  % Right Diagonal Sobel filter
elseif get(handles.radio_ld, 'Value') == 1
    choice = 'ld';  % Left Diagonal Sobel filter
else
    errordlg('Please select a Sobel filter type', 'Error');
    return;
end

% Ensure you have an image in global X or another source
global X;

% Call the Sobel function with the chosen filter
sharp = sobel(X, choice);

% Display the output in axes2
axes(handles.axes2);
imshow(sharp);


% --- Executes on button press in radio_h.
function radio_h_Callback(hObject, eventdata, handles)
% hObject    handle to radio_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_h


% --- Executes on button press in radio_rd.
function radio_rd_Callback(hObject, eventdata, handles)
% hObject    handle to radio_rd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_rd


% --- Executes on button press in radio_v.
function radio_v_Callback(hObject, eventdata, handles)
% hObject    handle to radio_v (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_v


% --- Executes on button press in radio_ld.
function radio_ld_Callback(hObject, eventdata, handles)
% hObject    handle to radio_ld (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_ld


% --- Executes on button press in Contrast_Streaching.
function Contrast_Streaching_Callback(hObject, eventdata, handles)
% hObject    handle to Contrast_Streaching (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X;
axes(handles.axes2);
ConSretch(X);


% --- Executes on button press in Histogram_Equalization.
function Histogram_Equalization_Callback(hObject, eventdata, handles)
% hObject    handle to Histogram_Equalization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X;
axes(handles.axes2);
histeq(X);


% --- Executes on button press in FourierTransform.
function FourierTransform_Callback(hObject, eventdata, handles)
% hObject    handle to FourierTransform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  global X; % Use the global variable to access the uploaded image

    % Check if an image has been uploaded
    if isempty(X)
        errordlg('No image uploaded. Please upload an image first.', 'Error');
        return;
    end
    
    % Convert the image to grayscale if it is RGB
    if size(X, 3) == 3
        img = rgb2gray(X);
    else
        img = X;
    end

    % Perform the Fourier Transform
    fftImage = fftshift(fft2(double(img))); % اعداد حفيقيه و تخيليه now it can not be shown casue it is complex array 
    magnitude = log(1 + abs(fftImage)); % Log scale for better visualization 
    %abs get red of imagin 
    %log or bright the image

    % Display the Fourier Transform in the designated axes
    axes(handles.axes2); % Replace 'axes2' with the tag of your desired axes
    imshow(magnitude, []);
    


% --- Executes on button press in InversFourier.
function InversFourier_Callback(hObject, eventdata, handles)
% hObject    handle to InversFourier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fftData; % Access the saved complex Fourier data

% Check if Fourier data exists
if isempty(fftData)
    errordlg('No Fourier Transform data found. Perform Fourier Transform first.', 'Error');
    return;
end

% Perform Inverse Fourier Transform
ifftImage = real(ifft2(ifftshift(fftData))); % Reconstruct spatial domain image

% Display the reconstructed image on axes2
axes(handles.axes2);


    


% --- Executes on button press in IdealL.
function IdealL_Callback(hObject, eventdata, handles)
% hObject    handle to IdealL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X; % Use the global variable X (the uploaded image)

    % Check if an image is uploaded
    if isempty(X)
        errordlg('Please upload an image first.', 'No Image Found');
        return;
    end

    % Convert the image to grayscale if it's RGB
    if size(X, 3) == 3
        img = rgb2gray(X);  % Convert to grayscale if it's RGB
    else
        img = X;  % Use the image as is if already grayscale
    end

    % Get the size of the image
    [M, N] = size(img);

    % Perform Fourier Transform
    img_fft = fft2(double(img));
    img_fft_shifted = fftshift(img_fft); % Shift zero frequency to the center

    % Create the IdealL Low Pass Filter (ILPF)
    D0 = 50; % Cutoff frequency (you can modify this value)
    [U, V] = meshgrid(-floor(N/2):floor(N/2)-1, -floor(M/2):floor(M/2)-1);
    D = sqrt(U.^2 + V.^2);  % Distance matrix

    % IdealL Low Pass Filter formula
    H = double(D <= D0);  % 1 inside the cutoff, 0 outside the cutoff

    % Apply the IdealL Low Pass Filter in the frequency domain
    img_fft_filtered = img_fft_shifted .* H;

    % Perform Inverse Fourier Transform to get the filtered image
    img_ifft = ifft2(ifftshift(img_fft_filtered)); % Inverse FFT and shift back
    img_ifft = real(img_ifft); % Take the real part for visualization

    % Display the original and filtered images in GUI axes
    axes(handles.axes1); % Show Original Image
    imshow(X, []);
    title('Original Image');
    
    axes(handles.axes2); % Show Filtered Image
    imshow(img_ifft, []);
    title('Filtered Image (Ideal Low Pass)');


% --- Executes on button press in GaussianL.
function GaussianL_Callback(hObject, eventdata, handles)
% hObject    handle to GaussianL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global X; % Use the global variable X (the uploaded image)

    % Check if an image is uploaded
    if isempty(X)
        errordlg('Please upload an image first.', 'No Image Found');
        return;
    end

    % Convert the image to grayscale if it's RGB
    if size(X, 3) == 3
        img = rgb2gray(X);  % Convert to grayscale if it's RGB
    else
        img = X;  % Use the image as is if already grayscale
    end

    % Define the cutoff frequency for the GaussianL Low Pass Filter
    D0 = 50; % You can adjust this value as needed

    % Call the GaussianLowPassFilter function
    filtered_img = GaussianLowPassFilter(img, D0);

    % Display the original and filtered images in GUI axes
    axes(handles.axes1); % Show Original Image
    imshow(X, []);
    title('Original Image');
    
    axes(handles.axes2); % Show Filtered Image
    imshow(filtered_img, []);


% --- Executes on button press in ButterworthL.
function ButterworthL_Callback(hObject, eventdata, handles)
% hObject    handle to ButterworthL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global X; % Use the global variable X (the uploaded image)

    % Check if an image is uploaded
    if isempty(X)
        errordlg('Please upload an image first.', 'No Image Found');
        return;
    end

    % Convert the image to grayscale if it's RGB
    if size(X, 3) == 3
        img = rgb2gray(X);  % Convert to grayscale if it's RGB
    else
        img = X;  % Use the image as is if already grayscale
    end

    % Define the cutoff frequency and order for the Butterworth Low Pass Filter
    D0 = 50;  % Cutoff frequency, adjust as needed
    n = 2;    % Order of the Butterworth filter, adjust as needed

    % Call the ButterworthLowPassFilter function
    filtered_img = ButterworthLowPassFilter(img, D0, n);

    % Display the original and filtered images in GUI axes
    axes(handles.axes1); % Show Original Image
    imshow(X, []);
    title('Original Image');
    
    axes(handles.axes2); % Show Filtered Image
    imshow(filtered_img, []);
    title('Filtered Image (Butterworth Low Pass)');


% --- Executes on button press in ButterworthH.
function ButterworthH_Callback(hObject, eventdata, handles)
% hObject    handle to ButterworthH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global X; % Use the global variable X (the uploaded image)

    % Check if an image is uploaded
    if isempty(X)
        errordlg('Please upload an image first.', 'No Image Found');
        return;
    end

    % Convert the image to grayscale if it's RGB
    if size(X, 3) == 3
        img = rgb2gray(X);  % Convert to grayscale if it's RGB
    else
        img = X;  % Use the image as is if already grayscale
    end

    % Define the cutoff frequency and the order for the Butterworth High Pass Filter
    D0 = 50;  % Cutoff frequency (adjustable)
    n = 2;    % Order of the filter (adjustable)

    % Call the ButterworthHighPassFilter function
    filtered_img = ButterworthHighPassFilter(img, D0, n);

    % Display the original and filtered images in GUI axes
    axes(handles.axes1); % Show Original Image
    imshow(X, []);
    title('Original Image');
    
    axes(handles.axes2); % Show Filtered Image
    imshow(filtered_img, []);
    title('Filtered Image (Butterworth High Pass)');

% --- Executes on button press in GaussianH.
function GaussianH_Callback(hObject, eventdata, handles)
% hObject    handle to GaussianH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global X; % Use the global variable X (the uploaded image)

    % Check if an image is uploaded
    if isempty(X)
        errordlg('Please upload an image first.', 'No Image Found');
        return;
    end

    % Convert the image to grayscale if it's RGB
    if size(X, 3) == 3
        img = rgb2gray(X);  % Convert to grayscale if it's RGB
    else
        img = X;  % Use the image as is if already grayscale
    end

    % Define the cutoff frequency for the Gaussian High Pass Filter
    D0 = 50;  % Cutoff frequency, adjust as needed

    % Call the GaussianHighPassFilter function
    filtered_img = GaussianHighPassFilter(img, D0);

    % Display the original and filtered images in GUI axes
    axes(handles.axes1); % Show Original Image
    imshow(X, []);
    title('Original Image');
    
    axes(handles.axes2); % Show Filtered Image
    imshow(filtered_img, []);
    title('Filtered Image (Gaussian High Pass)');


% --- Executes on button press in IdealH.
function IdealH_Callback(hObject, eventdata, handles)
% hObject    handle to IdealH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 global X; % Use the global variable X (the uploaded image)

    % Check if an image is uploaded
    if isempty(X)
        errordlg('Please upload an image first.', 'No Image Found');
        return;
    end

    % Convert the image to grayscale if it's RGB
    if size(X, 3) == 3
        img = rgb2gray(X);  % Convert to grayscale if it's RGB
    else
        img = X;  % Use the image as is if already grayscale
    end

    % Define the cutoff frequency for the Ideal High Pass Filter
    D0 = 50;  % Cutoff frequency, adjust as needed

    % Call the IdealHighPassFilter function
    filtered_img = IdealHighPassFilter(img, D0);

    % Display the original and filtered images in GUI axes
    axes(handles.axes1); % Show Original Image
    imshow(X, []);
    title('Original Image');
    
    axes(handles.axes2); % Show Filtered Image
    imshow(filtered_img, []);
    title('Filtered Image (Ideal High Pass)');

% --- Executes on button press in pushbutton35.
function pushbutton35_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton34.
function pushbutton34_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uipanel18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
imshow('1_Nak1bnD0RNSwfos7S7KZuQ.gif');


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
imshow('wallpaperflare.com_wallpaper(1).jpg');
% Hint: place code in OpeningFcn to populate axes3


% --- Executes during object creation, after setting all properties.
function axis3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axis3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
imshow('wallpaperflare.com_wallpaper(1).jpg')
% Hint: place code in OpeningFcn to populate axis3


% --- Executes on button press in Gama.
function Gama_Callback(hObject, eventdata, handles)
% hObject    handle to Gama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
% Get the boost factor value from the input field (edit_boost_factor)
GammaFactor = str2double(get(handles.GammaEdit, 'String'));

% Check if the input is a valid number
if isnan(GammaFactor) 
    % If invalid, show an error message and return
    errordlg('Please enter a valid factor', 'Invalid Input');
    return;
end

% Perform the high-boost filtering operation by calling the custom function 'highBoostFilter'

axes(handles.axes2);
GAMMA(X,GammaFactor);






% --- Executes on button press in Log.
function Log_Callback(hObject, eventdata, handles)
% hObject    handle to Log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
% Get the boost factor value from the input field (edit_boost_factor)
LogFactor = str2double(get(handles.LogEdit, 'String'));

% Check if the input is a valid number
if isnan(LogFactor) || LogFactor <= 0
    % If invalid, show an error message and return
    errordlg('Please enter a valid boost factor (positive number)', 'Invalid Input');
    return;
end

% Perform the high-boost filtering operation by calling the custom function 'highBoostFilter'

axes(handles.axes2);
Logfile(X,LogFactor);

% --- Executes on button press in pushbutton57.
function pushbutton57_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in InversLog.
function InversLog_Callback(hObject, eventdata, handles)
% hObject    handle to InversLog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
% Get the boost factor value from the input field (edit_boost_factor)
InvFactor = str2double(get(handles.InvLog, 'String'));

% Check if the input is a valid number
if isnan(InvFactor) || InvFactor <= 0
    % If invalid, show an error message and return
    errordlg('Please enter a valid boost factor (positive number)', 'Invalid Input');
    return;
end

% Perform the high-boost filtering operation by calling the custom function
% 'highBoostFilter'

axes(handles.axes2);
InversLogfile(X,InvFactor);




% --- Executes on button press in Negative.
function nigative_Image_Callback(hObject, eventdata, handles)
% hObject    handle to Negative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Load the image from an axes or file
global X;

% Convert the image to its negative
negativeImg = 255 - X;

% Display the negative image in a second axes (e.g., axes2)
axes(handles.axes2);
imshow(negativeImg);
title('Negative Image');



function InvLog_Callback(hObject, eventdata, handles)
% hObject    handle to InvLog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InvLog as text
%        str2double(get(hObject,'String')) returns contents of InvLog as a double


% --- Executes during object creation, after setting all properties.
function InvLog_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InvLog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LogEdit_Callback(hObject, eventdata, handles)
% hObject    handle to LogEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LogEdit as text
%        str2double(get(hObject,'String')) returns contents of LogEdit as a double


% --- Executes during object creation, after setting all properties.
function LogEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LogEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function GammaEdit_Callback(hObject, eventdata, handles)
% hObject    handle to GammaEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GammaEdit as text
%        str2double(get(hObject,'String')) returns contents of GammaEdit as a double


% --- Executes during object creation, after setting all properties.
function GammaEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GammaEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NigEdit_Callback(hObject, eventdata, handles)
% hObject    handle to NigEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NigEdit as text
%        str2double(get(hObject,'String')) returns contents of NigEdit as a double


% --- Executes during object creation, after setting all properties.
function NigEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NigEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Gaussian_Noise.
function Gaussian_Noise_Callback(hObject, eventdata, handles)
% hObject    handle to Gaussian_Noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global X
% Get the boost factor value from the input field (edit_boost_factor)
MeanFactor = str2double(get(handles.Mean_F, 'String'));
StandardFactor = str2double(get(handles.Standard, 'String'));

% Check if the input is a valid number
if isnan(MeanFactor) || MeanFactor < 0
    % If invalid, show an error message and return
    errordlg('Please enter a valid factor (positive number)', 'Invalid Input');
    return;
end
if isnan(StandardFactor) || StandardFactor < 0
    % If invalid, show an error message and return
    errordlg('Please enter a valid factor (positive number)', 'Invalid Input');
    return;
end

% Perform the high-boost filtering operation by calling the custom function
% 'highBoostFilter'

axes(handles.axes2);
gaussian_noise(X,MeanFactor,StandardFactor);





function Standard_Callback(hObject, eventdata, handles)
% hObject    handle to Standard (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Standard as text
%        str2double(get(hObject,'String')) returns contents of Standard as a double


% --- Executes during object creation, after setting all properties.
function Standard_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Standard (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mean_F_Callback(hObject, eventdata, handles)
% hObject    handle to mean_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mean_F as text
%        str2double(get(hObject,'String')) returns contents of mean_F as a double


% --- Executes during object creation, after setting all properties.
function mean_F_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mean_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Salt_Pepper.
function Salt_Pepper_Callback(hObject, eventdata, handles)
% hObject    handle to Salt_Pepper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
% Get the boost factor value from the input field (edit_boost_factor)
Saltfactor = str2double(get(handles.Salt_F, 'String'));
PepperFactor = str2double(get(handles.Pepper_F, 'String'));

% Check if the input is a valid number
if (isnan(Saltfactor) || Saltfactor < 0 || Saltfactor > 1) || ...
   (isnan(PepperFactor) || PepperFactor < 0 || PepperFactor > 1)
    % If invalid, show an error message and return
    errordlg('Please add values (from 0 to 1)', 'Invalid Input');
    return;
end

% Perform the high-boost filtering operation by calling the custom function
% 'highBoostFilter'

axes(handles.axes2);
salt_and_pepper_noise(X,Saltfactor,PepperFactor);





function Pepper_F_Callback(hObject, eventdata, handles)
% hObject    handle to Pepper_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pepper_F as text
%        str2double(get(hObject,'String')) returns contents of Pepper_F as a double


% --- Executes during object creation, after setting all properties.
function Pepper_F_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pepper_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Salt_F_Callback(hObject, eventdata, handles)
% hObject    handle to Salt_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Salt_F as text
%        str2double(get(hObject,'String')) returns contents of Salt_F as a double


% --- Executes during object creation, after setting all properties.
function Salt_F_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Salt_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Mean_F_Callback(hObject, eventdata, handles)
% hObject    handle to Mean_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Mean_F as text
%        str2double(get(hObject,'String')) returns contents of Mean_F as a double


% --- Executes during object creation, after setting all properties.
function Mean_F_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mean_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Max.
function Max_Callback(hObject, eventdata, handles)
% hObject    handle to Max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
% Get the boost factor value from the input field (edit_boost_factor)
MaxFactor = str2double(get(handles.Max_size, 'String'));

% Check if the input is a valid number
if isnan(MaxFactor) || MaxFactor <= 0
    % If invalid, show an error message and return
    errordlg('Please enter the mask size', 'Invalid Input');
    return;
end

% Perform the high-boost filtering operation by calling the custom function
% 'highBoostFilter'

axes(handles.axes2);
max_filter(X,MaxFactor);


% --- Executes on button press in Mean.
function Mean_Callback(hObject, eventdata, handles)
% hObject    handle to Mean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
% Get the boost factor value from the input field (edit_boost_factor)
MeanFactor = str2double(get(handles.Mean_size, 'String'));

% Check if the input is a valid number
if isnan(MeanFactor) || MeanFactor <= 0
    % If invalid, show an error message and return
    errordlg('Please enter the mask size', 'Invalid Input');
    return;
end

% Perform the high-boost filtering operation by calling the custom function
% 'highBoostFilter'

axes(handles.axes2);
mean_filter(X,MeanFactor);

% --- Executes on button press in Min.
function Min_Callback(hObject, eventdata, handles)
% hObject    handle to Min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
% Get the boost factor value from the input field (edit_boost_factor)
MinFactor = str2double(get(handles.Min_size, 'String'));

% Check if the input is a valid number
if isnan(MinFactor) || MinFactor <= 0
    % If invalid, show an error message and return
    errordlg('Please enter the mask size', 'Invalid Input');
    return;
end

% Perform the high-boost filtering operation by calling the custom function
% 'highBoostFilter'

axes(handles.axes2);
min_filter(X,MinFactor);

% --- Executes on button press in UnformedNois.
function UnformedNois_Callback(hObject, eventdata, handles)
% hObject    handle to UnformedNois (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global X;
% Get the noise range value from the input field (edit_NoiseRange)
NoiseMin = str2double(get(handles.Noise_Min, 'String'));
NoiseMax = str2double(get(handles.Noise_Max, 'String'));

% Check if the input is a valid number
if isnan(NoiseMin) || isnan(NoiseMax) || NoiseMin >= NoiseMax
    % If invalid, show an error message and return
    errordlg('Please enter a valid range (e.g., -1 to 1) where Min < Max.', 'Invalid Input');
    return;
end

% Define the noise range
noiseRange = [NoiseMin, NoiseMax];

% Call the custom function 'addUniformNoise'
axes(handles.axes2); % Specify the axes for the output
addUniformNoise(X, noiseRange);




function Noise_Max_Callback(hObject, eventdata, handles)
% hObject    handle to Noise_Max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Noise_Max as text
%        str2double(get(hObject,'String')) returns contents of Noise_Max as a double


% --- Executes during object creation, after setting all properties.
function Noise_Max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Noise_Max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Noise_Min_Callback(hObject, eventdata, handles)
% hObject    handle to Noise_Min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Noise_Min as text
%        str2double(get(hObject,'String')) returns contents of Noise_Min as a double


% --- Executes during object creation, after setting all properties.
function Noise_Min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Noise_Min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Basic.
function Basic_Callback(hObject, eventdata, handles)
% hObject    handle to Basic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.Sum, 'Value') == 1
    choice = 1 ;  % sum
elseif get(handles.Substruct, 'Value') == 1
    choice = 2;  % sub
elseif get(handles.Product, 'Value') == 1
    choice = 3;  % product
elseif get(handles.Division, 'Value') == 1
    choice = 4;  % Div
else
    errordlg('Please select a bi brightness type', 'Error');
    return;
end

% Ensure you have an image in global X or another source
global X;
BrightFactor = str2double(get(handles.B_fct, 'String'));

% Check if the input is a valid number
if isnan(BrightFactor) || BrightFactor <= 0
    % If invalid, show an error message and return
    errordlg('Please enter a valid boost factor (positive number)', 'Invalid Input');
    return;
end


% Call the Sobel function with the chosen filter
axes(handles.axes2);
brightness(X, choice, BrightFactor);








function B_fct_Callback(hObject, eventdata, handles)
% hObject    handle to B_fct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of B_fct as text
%        str2double(get(hObject,'String')) returns contents of B_fct as a double


% --- Executes during object creation, after setting all properties.
function B_fct_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B_fct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Sum.
function Sum_Callback(hObject, eventdata, handles)
% hObject    handle to Sum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Sum


% --- Executes on button press in Division.
function Division_Callback(hObject, eventdata, handles)
% hObject    handle to Division (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Division


% --- Executes on button press in Product.
function Product_Callback(hObject, eventdata, handles)
% hObject    handle to Product (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Product


% --- Executes on button press in Substruct.
function Substruct_Callback(hObject, eventdata, handles)
% hObject    handle to Substruct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Substruct


% --- Executes on button press in Median.
function Median_Callback(hObject, eventdata, handles)
% hObject    handle to Median (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
% Get the boost factor value from the input field (edit_boost_factor)
MidianFactor = str2double(get(handles.Median_size, 'String'));

% Check if the input is a valid number
if isnan(MidianFactor) || MidianFactor <= 0
    % If invalid, show an error message and return
    errordlg('Please enter the mask size', 'Invalid Input');
    return;
end

% Perform the high-boost filtering operation by calling the custom function
% 'highBoostFilter'

axes(handles.axes2);
median_filter(X,MidianFactor);




function Max_size_Callback(hObject, eventdata, handles)
% hObject    handle to Max_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Max_size as text
%        str2double(get(hObject,'String')) returns contents of Max_size as a double


% --- Executes during object creation, after setting all properties.
function Max_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Max_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Min_size_Callback(hObject, eventdata, handles)
% hObject    handle to Min_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Min_size as text
%        str2double(get(hObject,'String')) returns contents of Min_size as a double


% --- Executes during object creation, after setting all properties.
function Min_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Min_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Mean_size_Callback(hObject, eventdata, handles)
% hObject    handle to Mean_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Mean_size as text
%        str2double(get(hObject,'String')) returns contents of Mean_size as a double


% --- Executes during object creation, after setting all properties.
function Mean_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mean_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Median_size_Callback(hObject, eventdata, handles)
% hObject    handle to Median_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Median_size as text
%        str2double(get(hObject,'String')) returns contents of Median_size as a double


% --- Executes during object creation, after setting all properties.
function Median_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Median_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MidPoint.
function MidPoint_Callback(hObject, eventdata, handles)
% hObject    handle to MidPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X
% Get the boost factor value from the input field (edit_boost_factor)
MidFactor = str2double(get(handles.MidPoint_size, 'String'));

% Check if the input is a valid number
if isnan(MidFactor) || MidFactor <= 0
    % If invalid, show an error message and return
    errordlg('Please enter the mask size', 'Invalid Input');
    return;
end

% Perform the high-boost filtering operation by calling the custom function
% 'highBoostFilter'

axes(handles.axes2);
mid_point_filter(X,MidFactor);


function MidPoint_size_Callback(hObject, eventdata, handles)
% hObject    handle to MidPoint_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MidPoint_size as text
%        str2double(get(hObject,'String')) returns contents of MidPoint_size as a double


% --- Executes during object creation, after setting all properties.
function MidPoint_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MidPoint_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton75.
function pushbutton75_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton75 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Wighted_Avarage.
function Wighted_Avarage_Callback(hObject, eventdata, handles)
% hObject    handle to Wighted_Avarage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X;
axes(handles.axes2);
blurimgwavg(X);


% --- Executes on button press in Avarage.
function Avarage_Callback(hObject, eventdata, handles)
% hObject    handle to Avarage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X;
axes(handles.axes2);
blurimgavg(X);


% --- Executes on button press in Horizontal_S.
function Horizontal_S_Callback(hObject, eventdata, handles)
% hObject    handle to Horizontal_S (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Horizontal_S


% --- Executes on button press in Vertical_S.
function Vertical_S_Callback(hObject, eventdata, handles)
% hObject    handle to Vertical_S (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Vertical_S


% --- Executes on button press in Diagonal_Right_S.
function Diagonal_Right_S_Callback(hObject, eventdata, handles)
% hObject    handle to Diagonal_Right_S (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Diagonal_Right_S


% --- Executes on button press in Diagonal_Left_S.
function Diagonal_Left_S_Callback(hObject, eventdata, handles)
% hObject    handle to Diagonal_Left_S (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Diagonal_Left_S


% --- Executes on button press in All.
function All_Callback(hObject, eventdata, handles)
% hObject    handle to All (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of All


% --- Executes on button press in convolution.
function convolution_Callback(hObject, eventdata, handles)
% hObject    handle to convolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X;
mask = [1 1 1; 1 1 1; 1 1 1];
axes(handles.axes2);
convolution(X,mask);

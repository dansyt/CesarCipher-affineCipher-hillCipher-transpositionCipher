function varargout = kirpto(varargin)
% KIRPTO MATLAB code for kirpto.fig
%      KIRPTO, by itself, creates a new KIRPTO or raises the existing
%      singleton*.
%
%      H = KIRPTO returns the handle to a new KIRPTO or the handle to
%      the existing singleton*.
%
%      KIRPTO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KIRPTO.M with the given input arguments.
%
%      KIRPTO('Property','Value',...) creates a new KIRPTO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before kirpto_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to kirpto_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help kirpto

% Last Modified by GUIDE v2.5 28-Oct-2023 22:52:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @kirpto_OpeningFcn, ...
                   'gui_OutputFcn',  @kirpto_OutputFcn, ...
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


% --- Executes just before kirpto is made visible.
function kirpto_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to kirpto (see VARARGIN)

% Choose default command line output for kirpto
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes kirpto wait for user response (see UIRESUME)
% uiwait(handles.figure1);
    if isappdata(0, 'indeksFaktor')
        rmappdata(0, 'indeksFaktor');
    end

% --- Outputs from this function are returned to the command line.
function varargout = kirpto_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtInput_Callback(hObject, eventdata, handles)
% hObject    handle to txtInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtInput as text
%        str2double(get(hObject,'String')) returns contents of txtInput as a double


% --- Executes during object creation, after setting all properties.
function txtInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtOutput_Callback(hObject, eventdata, handles)
% hObject    handle to txtOutput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtOutput as text
%        str2double(get(hObject,'String')) returns contents of txtOutput as a double


% --- Executes during object creation, after setting all properties.
function txtOutput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtOutput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function key_Callback(hObject, eventdata, handles)
% hObject    handle to key (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of key as text
%        str2double(get(hObject,'String')) returns contents of key as a double


% --- Executes during object creation, after setting all properties.
function key_CreateFcn(hObject, eventdata, handles)
% hObject    handle to key (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnPilih.
function btnPilih_Callback(hObject, eventdata, handles)
% hObject    handle to btnPilih (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[namaFile, pathFile] = uigetfile('*.txt', 'Pilih File');

if isequal(namaFile, 0)
    return;
end

fullPath = fullfile(pathFile, namaFile);
isiFile = fileread(fullPath);

set(handles.txtInput, 'string', isiFile);

% --- Executes on button press in btnSimpan.
function btnSimpan_Callback(hObject, eventdata, handles)
% hObject    handle to btnSimpan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
folder = uigetdir('', 'Pilih Direktori Penyimpanan');
    
    if folder == 0 % Jika pengguna membatalkan pemilihan direktori
        return;
    end
    
    % Meminta pengguna untuk memasukkan nama file untuk penyimpanan
    namaFileSimpan = inputdlg('Masukkan nama file penyimpanan:', 'Simpan File', [1 50]);
    
    if isempty(namaFileSimpan)
        % Pengguna membatalkan penyimpanan
        return;
    end
    
    namaFileSimpan = namaFileSimpan{1}; % Mengambil string dari cell array
    
    fullPath = fullfile(folder, namaFileSimpan);
    
    % Mengambil isi dari Edit Text
    isiEdit = get(handles.txtOutput, 'String');
    
    try
        fileID = fopen(fullPath, 'w');
        fprintf(fileID, '%s', isiEdit);
        fclose(fileID);
        msgbox('File telah disimpan dengan sukses.', 'Sukses', 'modal');
    catch
        errordlg('Terjadi kesalahan saat menyimpan file.', 'Kesalahan', 'modal');
    end

% --- Executes on button press in btnEnkrip.
function btnEnkrip_Callback(hObject, eventdata, handles)
% hObject    handle to btnEnkrip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global metode;
inputTxt = get(handles.txtInput, 'string');

if metode == 2
    shift = get(handles.c, 'string');
    shift = str2num(shift);

    inputTxt = upper(inputTxt);
    enkripTxt = '';

    for i = 1 : length(inputTxt)
        if isletter(inputTxt(i))
            charCode = double(inputTxt(i)- 'A');
            enkripChar = mod(charCode + shift, 26)+'A';
            enkripTxt = [enkripTxt, char(enkripChar)];
        else
            enkripTxt = [enkripTxt, inputTxt(i)];
        end
    end
    set(handles.txtOutput, 'string', enkripTxt);
elseif metode == 3
    a = get(handles.affineA, 'string');
    a = str2num(a);
    b = get(handles.affineB, 'string');
    b = str2num(b);
     
    ciphertext = upper(inputTxt) - 'A';
    enkripText = mod(a*ciphertext+b, 26);

    % Convert numbers back to letters
    enkripText = char(enkripText+ 'A');
    set(handles.txtOutput, 'string', enkripText);
elseif metode == 4
    plainText = inputTxt;
    keyMatrix = get(handles.key, 'string');
    keyMatrix = str2num(keyMatrix);
    encryptedText = hillCipher(plainText, keyMatrix);
    set(handles.txtOutput, 'string', encryptedText);

elseif metode == 5
    kunci = get(handles.c, 'string');
    kunci = str2num(kunci);

    inputTxt = strrep(inputTxt, ' ', '');
    panjangInput = length(inputTxt);

    pesanEnkrip = '';

    for i = 1 : kunci 
        pesanEnkrip = [pesanEnkrip, inputTxt(i:kunci:panjangInput)];
    end
    set(handles.txtOutput, 'string', pesanEnkrip);
end

% --- Executes on button press in btnDekrip.
function btnDekrip_Callback(hObject, eventdata, handles)
% hObject    handle to btnDekrip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global metode;
inputTxt = get(handles.txtInput, 'string');

if metode == 2
    shift = get(handles.c, 'string');
    shift = str2num(shift);
    
    inputTxt = upper(inputTxt);
    dekripTxt = '';

    for i = 1: length(inputTxt)
        if isletter(inputTxt(i))
            charCode = double(inputTxt(i)-'A');
            dekripChar = mod(charCode - shift, 26) +'A';
            dekripTxt = [dekripTxt, char(dekripChar)];
        else
            dekripTxt=[dekripTxt, inputTxt(i)];
        end
    end
    set(handles.txtOutput, 'string', dekripTxt);
elseif metode == 3
    a = get(handles.affineA, 'string');
    a = str2num(a);
    b = get(handles.affineB, 'string');
    b = str2num(b);
    
    ciphertext = upper(inputTxt) - 'A';
    aInverse = modInverse(a, 26);

    plaintext = mod(aInverse* (ciphertext - b), 26);
    plaintext(plaintext<0) = plaintext(plaintext<0)+26;
    % Convert numbers back to letters
    plaintext = char(plaintext + 'A');
    set(handles.txtOutput, 'string', plaintext);
elseif metode == 4
   encryptedText = inputTxt;
   keyMatrix = get(handles.key, 'string');
   keyMatrix = str2num(keyMatrix);

   decryptedText = hillDecipher(encryptedText, keyMatrix);

   set(handles.txtOutput, 'string', decryptedText);

elseif metode == 5
    kunci = get(handles.c, 'string');
    kunci = str2num(kunci);

    panjangInput = length(inputTxt);
    panjangBagian = ceil(panjangInput/kunci);
    pesanDekrip = char(zeros(panjangBagian, kunci));
    index =1;
    for kolom = 1 : kunci
        for baris =1 : panjangBagian
            pesanDekrip(baris, kolom) = inputTxt(index);
            index = index +1;
        end
    end
    pesanDekrip = reshape(pesanDekrip',1, []);
    set(handles.txtOutput, 'string', pesanDekrip);
end

% --- Executes on button press in btnClear.
function btnClear_Callback(hObject, eventdata, handles)
% hObject    handle to btnClear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.txtInput, 'string', '');
set(handles.txtOutput, 'string', '');
set(handles.key, 'string', '');
set(handles.metodeKripto, 'Value', 1);
set(handles.keyInfo, 'string', '');
set(handles.affineA, 'visible', 'off');
    set(handles.affineB, 'visible', 'off');
    set(handles.aPlus, 'visible', 'off');
    set(handles.aMin, 'visible', 'off');
    set(handles.bPlus, 'visible', 'off');
    set(handles.bMin, 'visible', 'off');
    set(handles.cekKey, 'visible', 'off');
    set(handles.c, 'visible','off');
    set(handles.cPlus, 'visible', 'off')
    set(handles.cMin, 'visible', 'off')
set(handles.key, 'visible', 'on')
% --- Executes on selection change in metodeKripto.
function metodeKripto_Callback(hObject, eventdata, handles)
% hObject    handle to metodeKripto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns metodeKripto contents as cell array
%        contents{get(hObject,'Value')} returns selected item from metodeKripto
global metode;
metode = get(hObject, 'Value');
if metode == 2
    set(handles.key, 'visible', 'off');
    set(handles.affineA, 'visible', 'off');
    set(handles.affineB, 'visible', 'off');
    set(handles.aPlus, 'visible', 'off');
    set(handles.aMin, 'visible', 'off');
    set(handles.bPlus, 'visible', 'off');
    set(handles.bMin, 'visible', 'off');
    set(handles.cekKey, 'visible', 'off');
    set(handles.c, 'visible','on');
    set(handles.cPlus, 'visible', 'on')
    set(handles.cMin, 'visible', 'on')
    set(handles.keyInfo, 'string', 'Pilih kunci berupa bilangan bulat');
    set(handles.c, 'string', '1');
    
elseif metode == 3
    set(handles.key, 'visible', 'off');
    set(handles.affineA, 'visible', 'on');
    set(handles.affineB, 'visible', 'on');
    set(handles.aPlus, 'visible', 'on');
    set(handles.aMin, 'visible', 'on');
    set(handles.bPlus, 'visible', 'on');
    set(handles.bMin, 'visible', 'on');
    set(handles.cekKey, 'visible', 'off');
    set(handles.c, 'visible','off');
    set(handles.cPlus, 'visible', 'off')
    set(handles.cMin, 'visible', 'off')
    set(handles.keyInfo, 'string', 'Pilih kunci A dan B');
    set(handles.affineA, 'string', '1');
    set(handles.affineB, 'string', '1');
    
elseif metode == 4
    set(handles.key, 'visible', 'on');
    set(handles.affineA, 'visible', 'off');
    set(handles.affineB, 'visible', 'off');
    set(handles.keyInfo, 'string', 'Masukkan matriks persegi yang memiliki determinant prima');
    set(handles.aPlus, 'visible', 'off');
    set(handles.aMin, 'visible', 'off');
    set(handles.bPlus, 'visible', 'off');
    set(handles.bMin, 'visible', 'off');
    set(handles.cekKey, 'visible', 'off');
    set(handles.c, 'visible','off');
    set(handles.cPlus, 'visible', 'off')
    set(handles.cMin, 'visible', 'off')
elseif metode == 5
    set(handles.key, 'visible', 'off');
    set(handles.affineA, 'visible', 'off');
    set(handles.affineB, 'visible', 'off');
    set(handles.keyInfo, 'string', 'Pilih kunci berupa angka')
    set(handles.aPlus, 'visible', 'off');
    set(handles.aMin, 'visible', 'off');
    set(handles.bPlus, 'visible', 'off');
    set(handles.bMin, 'visible', 'off');
    set(handles.cekKey, 'visible', 'off');
    set(handles.c, 'visible','on');
    set(handles.cPlus, 'visible', 'on')
    set(handles.cMin, 'visible', 'on')
    set(handles.c, 'string', '0');
    
elseif metode == 1
    set(handles.affineA, 'visible', 'off');
    set(handles.affineB, 'visible', 'off');
    set(handles.aPlus, 'visible', 'off');
    set(handles.aMin, 'visible', 'off');
    set(handles.bPlus, 'visible', 'off');
    set(handles.bMin, 'visible', 'off');
    set(handles.cekKey, 'visible', 'off');
    set(handles.c, 'visible','off');
    set(handles.cPlus, 'visible', 'off')
    set(handles.cMin, 'visible', 'off')
    set(handles.key, 'visible', 'on')
   
end

% --- Executes during object creation, after setting all properties.
function metodeKripto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to metodeKripto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function encryptedText = hillCipher(plainText, keyMatrix)
    % Fungsi untuk mengenkripsi teks menggunakan Hill Cipher

    % Menyusun teks terbuka ke dalam bentuk matriks
    plainText = upper(plainText);  % Mengonversi teks terbuka ke huruf besar
    plainText = strrep(plainText, ' ', '');  % Menghapus spasi

    % Menentukan ukuran matriks kunci
    keySize = size(keyMatrix, 1);

    % Menambahkan karakter tambahan jika panjang teks tidak kelipatan dari ukuran matriks kunci
    while mod(length(plainText), keySize) ~= 0
        plainText = [plainText, 'X'];
    end

    % Mengonversi teks terbuka ke dalam bentuk angka sesuai dengan alfabet
    plainTextNumbers = double(plainText) - double('A')+1;

    % Membagi teks terbuka ke dalam blok-blok sesuai dengan ukuran matriks kunci
    plainTextMatrix = reshape(plainTextNumbers, keySize, []);

    % Mengenkripsi setiap blok
    encryptedTextMatrix = mod(keyMatrix * plainTextMatrix, 26);

    % Mengonversi matriks hasil enkripsi ke dalam bentuk teks terenkripsi
    encryptedTextNumbers = reshape(encryptedTextMatrix, 1, []);
    encryptedText = char(encryptedTextNumbers + double('A')-1);

function invMod = modInverse(a, m)
    a = mod(a, m);
    for invMod = 1 : m
        if (mod(a * invMod, m) == 1)
            return;
        end
    end


function decryptedText = hillDecipher(encryptedText, keyMatrix)
    % Menyusun teks terenkripsi ke dalam bentuk matriks
    encryptedText = upper(encryptedText);  % Mengonversi teks terenkripsi ke huruf besar
    encryptedText = strrep(encryptedText, ' ', '');  % Menghapus spasi

    % Menentukan ukuran matriks kunci
    keySize = size(keyMatrix, 1);

    % Mengonversi teks terenkripsi ke dalam bentuk angka sesuai dengan alfabet
    encryptedTextNumbers = double(encryptedText) - double('A')+1;

    % Membagi teks terenkripsi ke dalam blok-blok sesuai dengan ukuran matriks kunci
    encryptedTextMatrix = reshape(encryptedTextNumbers, keySize, []);

    % Mendekripsi setiap blok
    keyMatrixInverse = round(det(keyMatrix) * inv(keyMatrix)); % adjoint method
    keyMatrixInverse = mod(keyMatrixInverse, 26);
    detInverse = modInverse(round(det(keyMatrix)), 26);
    keyMatrixInverse = round(detInverse * keyMatrixInverse); % modular multiplicative inverse
    keyMatrixInverse = mod(keyMatrixInverse, 26);
    decryptedTextMatrix = mod(keyMatrixInverse * encryptedTextMatrix, 26);

    % Mengonversi matriks hasil dekripsi ke dalam bentuk teks terdekripsi
    decryptedTextNumbers = reshape(decryptedTextMatrix, 1, []);
    decryptedText = char(decryptedTextNumbers + double('A')-1);



function keyInfo_Callback(hObject, eventdata, handles)
% hObject    handle to keyInfo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of keyInfo as text
%        str2double(get(hObject,'String')) returns contents of keyInfo as a double


% --- Executes during object creation, after setting all properties.
function keyInfo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to keyInfo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cekKey.
function cekKey_Callback(hObject, eventdata, handles)
% hObject    handle to cekKey (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global metode;

if metode ==2
elseif metode ==3
elseif metode ==4
    matriks = get(handles.key, 'string');
    matriks = str2num(matriks);

    number = det(matriks);
    result = isprime(number);
    if isPrime(number)
        msgbox('kunci sudah benar');
    else 
        errordlg('kunci salah, harap masukkan matriks persegi yang memiliki determinant prima');
    end
    

elseif metode ==5
end
function result = isPrime(number)
    if number <= 1
        result = false;
        return;
    end

    if number == 2
        result = true;
        return;
    end

    if mod(number, 2) == 0
        result = false;
        return;
    end

    sqrtNumber = sqrt(number);
    for i = 3:2:sqrtNumber
        if mod(number, i) == 0
            result = false;
            return;
        end
    end

    result = true;




function affineA_Callback(hObject, eventdata, handles)
% hObject    handle to affineA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of affineA as text
%        str2double(get(hObject,'String')) returns contents of affineA as a double


% --- Executes during object creation, after setting all properties.
function affineA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to affineA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function affineB_Callback(hObject, eventdata, handles)
% hObject    handle to affineA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of affineA as text
%        str2double(get(hObject,'String')) returns contents of affineA as a double


% --- Executes during object creation, after setting all properties.
function affineB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to affineA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in aPlus.
function aPlus_Callback(hObject, eventdata, handles)
% hObject    handle to aPlus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
currentNumber = get(handles.affineA, 'string');
currentNumber = str2num(currentNumber);
currentNumber = currentNumber +1;

while true
        a = currentNumber;
        b = 26;
        isRelativelyPrime = true;
        while b ~= 0
            a = mod(a, b);
            temp = a;
            a = b;
            b = temp;
        end
        if a ~= 1
            isRelativelyPrime = false;
        end
        if isRelativelyPrime
            % Jika bilangan merupakan bilangan relatif prima dengan 26,
            % tampilkan dan keluar dari loop.
            set(handles.affineA, 'String', num2str(currentNumber));
            break;
        else
            % Jika bukan bilangan relatif prima, lanjut ke bilangan berikutnya.
            currentNumber = currentNumber + 1;
        end
    end
if currentNumber ~= 1
    set(handles.aMin, 'enable', 'on');
end
% --- Executes on button press in aMin.
function aMin_Callback(hObject, eventdata, handles)
% hObject    handle to aMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

currentNumber = get(handles.affineA, 'string');
currentNumber = str2num(currentNumber);
currentNumber = currentNumber - 1;


    while true
        if currentNumber <= 0
            currentNumber = 1;
        end
        
        a = currentNumber;
        b = 26;
        isRelativelyPrime = true;
        while b ~= 0
            a = mod(a, b);
            temp = a;
            a = b;
            b = temp;
        end
        if a ~= 1
            isRelativelyPrime = false;
        end
        if isRelativelyPrime
            % Jika bilangan merupakan bilangan relatif prima dengan 26,
            % tampilkan dan keluar dari loop.
            set(handles.affineA, 'String', num2str(currentNumber));
            break;
        else
            % Jika bukan bilangan relatif prima, kembali ke bilangan sebelumnya.
            currentNumber = currentNumber - 1;
        end
    end
if currentNumber == 1
    set(handles.aMin, 'enable', 'off');
end
% --- Executes on button press in bPlus.
function bPlus_Callback(hObject, eventdata, handles)
% hObject    handle to bPlus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b = get(handles.affineB, 'string');
b = str2num(b);

b = b +1;
set(handles.affineB, 'string', num2str(b));
if b ~= 1
    set(handles.bMin, 'enable', 'on');
end
% --- Executes on button press in bMin.
function bMin_Callback(hObject, eventdata, handles)
% hObject    handle to bMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b = get(handles.affineB, 'string');
b = str2num(b);

b = b -1;
set(handles.affineB, 'string', num2str(b));
if b == 1
    set(handles.bMin, 'enable', 'off');
end



function c_Callback(hObject, eventdata, handles)
% hObject    handle to c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c as text
%        str2double(get(hObject,'String')) returns contents of c as a double


% --- Executes during object creation, after setting all properties.
function c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cPlus.
function cPlus_Callback(hObject, eventdata, handles)
% hObject    handle to cPlus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global metode;
ctxt = get(handles.c, 'string');
ctxt = str2num(ctxt);

if metode == 2
    ctxt = ctxt +1;
    set(handles.c, 'string', num2str(ctxt));
    if ctxt ~= 1
        set(handles.cMin, 'enable', 'on');
    end
elseif metode == 5
    if ctxt ~= 0
        set(handles.cMin, 'enable', 'on');
    end
    
    input=get(handles.txtInput, 'string');
    input = strrep(input, ' ', '');
    angka = length(input);
    faktor = cariFaktor(angka);
    % Mengambil nilai indeksFaktor yang tersimpan, atau inisialisasi ke 1 jika tidak ada data
    indeksFaktor = getappdata(0, 'indeksFaktor');
    
    if isempty(indeksFaktor) || indeksFaktor < 1
        indeksFaktor = 1; % Inisialisasi ke 1 jika tidak ada data atau kurang dari 1
    end
    if indeksFaktor <= length(faktor)
        % Menampilkan faktor berikutnya
        set(handles.c, 'String', num2str(faktor(indeksFaktor)));
        
        % Menambahkan indeks faktor untuk pemanggilan berikutnya
        indeksFaktor = indeksFaktor +1;
        setappdata(0, 'indeksFaktor', indeksFaktor);
        if indeksFaktor == 0
            indeksFaktor = length(faktor);
            setappdata(0, 'indeksFaktor', indeksFaktor);
        end
        if indeksFaktor > length(faktor)
            indeksFaktor = 1;
            setappdata(0, 'indeksFaktor', indeksFaktor);
        end
        
    else
        % Reset indeks faktor jika telah mencapai faktor terakhir
        indeksFaktor = 1;
        setappdata(0, 'indeksFaktor', indeksFaktor);
    end
    
end
function faktor = cariFaktor(angka)
    faktor = [];
    for i = 1:angka
        if mod(angka, i) == 0
            faktor = [faktor, i];
        end
    end

% --- Executes on button press in cMin.
function cMin_Callback(hObject, eventdata, handles)
% hObject    handle to cMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global metode;
ctxt = get(handles.c, 'string');
ctxt = str2num(ctxt);

if metode ==2
    ctxt = ctxt-1;
    set(handles.c, 'string', num2str(ctxt));
    if ctxt == 1
        set(handles.cMin, 'enable', 'off');
    end
    
elseif metode == 5
    input = get(handles.txtInput, 'string');
    input = strrep(input, ' ', '');
    angka = length(input);
    faktor = cariFaktor(angka);
    indeksFaktor = getappdata(0, 'indeksFaktor'); % Mengambil nilai indeks faktor dari data aplikasi
    
    if indeksFaktor > 1
        % Menampilkan faktor indeks sebelumnya
        set(handles.c, 'string', num2str(faktor(indeksFaktor - 1)));
        indeksFaktor = indeksFaktor - 1;
        setappdata(0, 'indeksFaktor', indeksFaktor);
    end
    if indeksFaktor <= 1
       indeksFaktor = 1;
       set(handles.c, 'string', num2str(faktor(indeksFaktor)));
       setappdata(0, 'indeksFaktor', indeksFaktor);
    end

end

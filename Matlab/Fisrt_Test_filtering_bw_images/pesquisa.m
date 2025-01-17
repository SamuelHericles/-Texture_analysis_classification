%{
                    FEDERAL UNIVERSITY OF CEARA
                         CAMPUS - SOBRAL
                   COMPUTER ENGINEER ING DEPARTMENT
                   SAMUEL HERICLES SOUZA SILVERIA
                 TEXTURE ANALYSIS AND CLASSIFICATION

                         METHODOLOGY

  |------------| |-----------| |-----------| |--------------------------|
  | FILTERING  |>|  FEATURE  |>|  FEATURE  |>| CLASSIFICATION ALGORITHM | 
  |------------| | EXTRATION | | SELECTION | |         (LDA)            | 
                 |-----------| |-----------| |--------------------------|                  
%}
clc
%% Initial conditions

bool_img_pb = evalin("base","exist('img_pb') ~= 1");
bool_img_pb_wiener = evalin("base","exist('img_pb_wiener') ~= 1");
%% Load images

if evalin("base","exist('images') ~= 1")
    images = load_images();
end
%% Filtering

if bool_img_pb && bool_img_pb_wiener

    %Black and white filter
    img_pb = filt_pb(images);
    
end
%% Tests - 1
%{ 
    I was used some as graph method called deep search that measured the 
length line with '1' and counting amount this lines of same length.
%}
feature_hist = fake_graph_deep(img_pb);

% %% Test - 2  

clc

%% Features vector

X = []; 

var = funcao_testar(X);
%% If i put a zero or anyone number vector the model gain 100% acc

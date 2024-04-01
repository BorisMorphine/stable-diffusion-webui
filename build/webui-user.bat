@echo off

REM Navigate to workspace
cd /D "workspace\home\user\stable-diffusion-webui-forge\"

REM Set environment variables
set PYTHON=3.10.14
set GIT=git

REM Cloning repos into Forge
set A1111_HOME=workspace\home\user\stable-diffusion-webui
set VENV_DIR=%A1111_HOME%\venv
set MODELS_DIR=%A1111_HOME%\models
set EXTENSONS_DIR=$A1111_HOME\models
set EMBEDDINGS_DIR=%A1111_HOME%\embeddings
set COMMANDLINE_ARGS=--port 7860 --listen --api --xformers --enable-insecure-extension-access --no-half-vae

REM Setting model subdirectories
set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --ckpt-dir %MODELS_DIR%\Stable-diffusion
set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --dreambooth-dir %MODELS_DIR%\dreambooth
set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --hypernetwork-dir %MODELS_DIR%\hypernetworks
set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --lora-dir %MODELS_DIR%\Lora
set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --annotators-dir %MODELS_DIR%\annotators
set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --codeformers-dir %MODELS_DIR%\Codeformer
set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --deepbooru-dir %MODELS_DIR%\deepbooru
set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --gfpgan-dir %MODELS_DIR%\GFPGAN
set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --insightface-dir %MODELS_DIR%\insightface
set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --karlo-dir %MODELS_DIR%\karlo
set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --LDSR-dir %MODELS_DIR%\LDSR
set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --swinIR-dir %MODELS_DIR%\swinIR
set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --vae-approx-dir %MODELS_DIR%\VAE-approx

REM Call the webui script with prepared variables
call "%VENV_DIR%\Scripts\activate"
python webui.py %COMMANDLINE_ARGS%

exit /b %ERRORLEVEL%

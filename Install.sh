#!/bin/bash
pip install -r requirements.txt

echo ""
echo "Requirements installed successfully."

python3 -m dfss --url=open@sophgo.com:sophon-demo/Whisper/model_240327/models.zip
unzip models.zip
rm models.zip


mkdir -p models/BM1684X
pushd ../models/BM1684X
python3 -m dfss --url=open@sophgo.com:sophon-demo/Qwen/qwen-7b_int4_1dev.bmodel
python3 -m dfss --url=open@sophgo.com:sophon-demo/Qwen/qwen-7b_int8_1dev.bmodel
popd

if [ ! -d "/token_config" ];
then
    pushd .
    python3 -m dfss --url=open@sophgo.com:sophon-demo/Qwen/token_config.zip
    unzip token_config.zip
    rm token_config.zip
    popd
else
    echo "token_config exists! Remove it if you need to update."
fi

echo "Models download successfully."

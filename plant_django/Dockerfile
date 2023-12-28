# 建立python環境
FROM python:3.10

# 設置python環境變量
ARG HOME
ARG APP_PATH
ARG STATIC_PATH
ARG MEDIA_PATH
ARG PIP_CACHE_PATH

ENV PYTHONUNBUFFERED 1
ENV HOME $HOME
WORKDIR $HOME

# 建立虛擬環境
ENV VIRTUAL_ENV=/opt/plantweb_venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN mkdir -p $APP_PATH\
    && mkdir -p $STATIC_PATH\
    && chmod -R 755 $STATIC_PATH\
    && mkdir -p $MEDIA_PATH

COPY requirements.txt .

# 下載需求的資料檔案
RUN --mount=type=cache,target=$PIP_CACHE_PATH \
    pip3 install --upgrade pip \
    && pip3 install -r requirements.txt \
    && rm requirements.txt

# 設定主要工作目錄
WORKDIR $APP_PATH

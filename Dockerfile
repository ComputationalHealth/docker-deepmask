FROM datasci/torch
MAINTAINER Wade Schulz <wade.schulz@yale.edu>

RUN luarocks install image && \
	luarocks install tds && \
	luarocks install json && \
	luarocks install nnx && \
	luarocks install optim && \
	luarocks install inn && \
	luarocks install cutorch && \
	luarocks install cunn && \
	luarocks install cudnn

RUN git clone https://github.com/pdollar/coco.git ~/coco && \
		cd ~/coco && luarocks make LuaAPI/rocks/coco-scm-1.rockspec && \
		cd /home/datasci

RUN mkdir /home/datasci/deepmask
ENV DEEPMASK=/home/datasci/deepmask

RUN git clone https://github.com/facebookresearch/deepmask.git $DEEPMASK

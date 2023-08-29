FROM hugomods/hugo:0.117.0 as builder

WORKDIR /src
COPY . /src

RUN cd /src && hugo

FROM pierrezemb/gostatic
COPY --from=builder /src/public/ /srv/http/


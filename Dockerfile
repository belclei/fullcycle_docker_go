FROM golang:rc-alpine3.14 AS builder

WORKDIR /app

COPY ./main.go .

RUN go build main.go

FROM scratch

COPY --from=builder /app/main .

CMD [ "./main" ]
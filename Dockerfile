FROM registry.gitlab.com/pages/hugo/hugo_extended:0.109.0 AS builder

WORKDIR /app

COPY . .

RUN hugo --buildFuture --minify

FROM flashspys/nginx-static:latest

COPY --from=builder /app/public /static

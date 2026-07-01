FROM python:3.13-slim AS builder

WORKDIR /site

# Install MkDocs with Material theme
RUN pip install --no-cache-dir mkdocs mkdocs-material

# Copy source
COPY mkdocs.yml .
COPY docs/ ./docs/

# Build static site
RUN mkdocs build --site-dir /build-output

# Production stage: nginx
FROM nginx:stable-alpine

# Copy built site
COPY --from=builder /build-output /usr/share/nginx/html

# Custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=8s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://127.0.0.1/ || exit 1

LABEL org.opencontainers.image.title="SUSE Cloud Native Wiki" \
      org.opencontainers.image.description="Deep study wiki for SUSE Cloud Native portfolio positioning exercise" \
      org.opencontainers.image.version="1.0.0"

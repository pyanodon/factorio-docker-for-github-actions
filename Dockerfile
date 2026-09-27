# hadolint global ignore=DL3007
# checkov:skip=CKV_DOCKER_7: latest is desirable here
# checkov:skip=CKV_DOCKER_3: pre-existing ignore from upstream
FROM factoriotools/factorio:latest

COPY ./entrypoint.sh /entrypoint.sh

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD pgrep factorio || exit 1

ENTRYPOINT ["/entrypoint.sh"]

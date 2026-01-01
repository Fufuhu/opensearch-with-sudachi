# opensearch-with-sudachi
OpenSearch with analyser-sudachi

[OpenSearch](https://opensearch.org/)のDocker版を使って、[WorksApplications/elasticsearch-sudachi](https://github.com/WorksApplications/elasticsearch-sudachi)を利用するためのサンプルです。

# 利用方法

## 前提

- unzip, curlがインストールされていること
- Dockerがインストールされていること

## 事前準備

- `scripts/download-sudachi-dict.sh`を実行して、Sudachiの辞書ファイルをダウンロードします。

```bash
chmod +x scripts/download-sudachi-dict.sh
./scripts/download-sudachi-dict.sh
```

リポジトリルートのsudachiディレクトリに辞書ファイルがダウンロードされます。

## OpenSearchの起動

docker composeでOpenSearchを起動します。

```bash
docker compose up -d
```

OpenSearchのエンドポイントにアクセスして確認します。

```bash
curl http://127.0.0.1:9200/_cat/plugins?v
```

```
name         component                            version
b5a6579c8aa2 analysis-icu                         2.18.0
b5a6579c8aa2 analysis-sudachi                     3.3.0
b5a6579c8aa2 opensearch-alerting                  2.18.0.0
b5a6579c8aa2 opensearch-anomaly-detection         2.18.0.0
b5a6579c8aa2 opensearch-asynchronous-search       2.18.0.0
b5a6579c8aa2 opensearch-cross-cluster-replication 2.18.0.0
b5a6579c8aa2 opensearch-custom-codecs             2.18.0.0
b5a6579c8aa2 opensearch-flow-framework            2.18.0.0
b5a6579c8aa2 opensearch-geospatial                2.18.0.0
b5a6579c8aa2 opensearch-index-management          2.18.0.0
b5a6579c8aa2 opensearch-job-scheduler             2.18.0.0
b5a6579c8aa2 opensearch-knn                       2.18.0.0
b5a6579c8aa2 opensearch-ml                        2.18.0.0
b5a6579c8aa2 opensearch-neural-search             2.18.0.0
b5a6579c8aa2 opensearch-notifications             2.18.0.0
b5a6579c8aa2 opensearch-notifications-core        2.18.0.0
b5a6579c8aa2 opensearch-observability             2.18.0.0
b5a6579c8aa2 opensearch-performance-analyzer      2.18.0.0
b5a6579c8aa2 opensearch-reports-scheduler         2.18.0.0
b5a6579c8aa2 opensearch-security                  2.18.0.0
b5a6579c8aa2 opensearch-security-analytics        2.18.0.0
b5a6579c8aa2 opensearch-skills                    2.18.0.0
b5a6579c8aa2 opensearch-sql                       2.18.0.0
b5a6579c8aa2 opensearch-system-templates          2.18.0.0
b5a6579c8aa2 query-insights                       2.18.0.0
```


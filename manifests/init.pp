# go_carbon
#
# Main class, includes all other classes.
#
# @param version
#   Specifies the package version for go-carbon. Default value: 0.14.0 .
#
# @param conf_dir
#   Specifies a directory for go-carbon's configuration files. Default value: '/etc/go-carbon'.
#
# @param log_dir
#   Specifies the log file destination for go-carbon logs. Default value: '/var/log/go-carbon'.
#
# @param user
#   Run as user. Works only in daemon mode. Default value: 'carbon'
#
# @param download_path
#   Specifies the destination of the downloaded package. Default value: '/tmp'.
#
# @param service_ensure
#   Wheter the go-carbon service should be running. Default value: 'running'.
#
# @param service_enable
#   Wheter to enable the go-carbon service at boot. Default value: true.
#
# @param download_package
#   Specifies to download the go-carbon package from GitHub. Default value: false.
#
# @param graph_prefix
#   Prefix for store all internal go-carbon graphs. Supported macroses: {host}. Default value: 'carbon.agents.{host}'.
#
# @param metric_endpoint
#   Endpoint for store internal carbon metrics. Valid values: "" or "local", "tcp://host:port", "udp://host:port".
#   Default value: 'local'.
#
# @param metric_interval
#   Interval of storing internal metrics. Like CARBON_METRIC_INTERVAL. Default value: '1m0s'.
#
# @param max_cpu
#   Increase for configuration with multi persister workers. Default value: 4.
#
# @param whisper_data_dir
#   Specifies the directory of whisper. Default value: '/var/lib/graphite/whisper'.
#
# @param whisper_schemas_file
#   Specifies the directory of whisper storage schemas file. Default value: '/etc/go-carbon/storage-schemas.conf'.
#
# @param whisper_aggregation_file
#   Specifies the directory of whisper storage aggreation file. Default value: '/etc/go-carbon/storage-aggregation.conf'.
#
# @param whisper_workers
#   Worker threads count. Metrics sharded by "crc32(metricName) % workers". Default value: 8
#
# @param whisper_max_updates_per_second
#   Limits the number of whisper update_many() calls per second. 0 - no limit. Default value: 0
#
# @param whisper_max_creates_per_second
#   Softly limits the number of whisper files that get created each second. 0 - no limit. Default value: 0
#
# @param whisper_hard_max_creates_per_second
#   Make max-creates-per-second a hard limit. Extra new metrics are dropped. A hard throttle of 0 drops all new metrics.
#   Default value: false.
#
# @param whisper_sparse_create
#   Sparse file creation. Default value: false.
#
# @param whisper_flock
#   Use flock on every file call (ensures consistency if there are concurrent read/writes to the same file). Default value: true.
#
# @param whisper_flock_enabled
#   Use flock on every file call (ensures consistency if there are concurrent read/writes to the same file). Default value: true.
#
# @param whisper_hash_filenames
#   Use hashed filenames for tagged metrics instead of human readable. Default value: true.
#
# @param cache_max_size
#   Limit of in-memory stored points (not metrics). Default value: 1000000 .
#
# @param cache_write_strategy
#   Capacity of queue between receivers and cache
#   Strategy to persist metrics. Values: "max","sorted","noop".
#     "max" - write metrics with most unwritten datapoints first
#     "sorted" - sort by timestamp of first unwritten datapoint.
#     "noop" - pick metrics to write in unspecified order,
#              requires least CPU and improves cache responsiveness
#   Default value: 'max'.
#
# @param udp_enabled
#   Enables upd. Default value: true.
#
# @param udp_port
#   Specifies the port for udp. Default value: ':2003'.
#
# @param udp_buffer_size
#   Optional internal queue between receiver and cache. Default value: 0 .
#
# @param tcp_enabled
#   Enables tcp. Default value: true.
#
# @param tcp_port
#   Specifies the port for tcp. Default value: ':2003'
#
# @param tcp_buffer_size
#   Optional internal queue between receiver and cache. Default value: 0 .
#
# @param pickle_enabled
#   Whether to enable pickle. Default value: true.
#
# @param pickle_port
#   Specifies the port for pickle. Default value: ':2004'.
#
# @param pickle_max_message_size
#   Limit message size for prevent memory overflow. Default value: 67108864 .
#
# @param pickle_buffer_size
#   Optional internal queue between receiver and cache. Default value: 0 .
#
# @param carbonlink_enabled
#   Whether to enable carbonlink. Default value: true.
#
# @param carbonlink_listen
#   Specifies the IP-Address with port for carbonlink. Defaul value: '127.0.0.1:7002'.
#
# @param carbonlink_read_timeout
#   Close inactive connections after "read-timeout". Default value: '30s'.
#
# @param grpc_enabled
#   Whether to enable grpc api. Default value: true.
#
# @param grpc_listen
#   Specifies the IP-Address with port for grpc api. Default value: '127.0.0.1:7003'.
#
# @param tags_enabled
#   Whether to enable tags. Default value: false.
#
# @param tagdb_url
#   TagDB url. It should support /tags/tagMultiSeries endpoint. Default value: 'http://127.0.0.1:8000'.
#
# @param tagdb_chunk_size
#   TODO
#
# @param tagdb_update_interval
#   TODO
#
# @param tagdb_local_dir
#  Directory for send queue (based on leveldb). Default value: '/var/lib/graphite/tagging/'.
#
# @param tagdb_timeout
#   POST timeout. Default value: '1s'.
#
# @note carbonserver is not intended to fully replace graphite-web it acts as a "REMOTE_STORAGE" for graphite-web or carbonzipper/carbonapi.
#       Carbonserver support is still experimental and may contain bugs or be incompatible with github.com/grobian/carbonserver
# @param carbonserver_listen
#   Specifies the IP-Address with port for carbonserver. Default value: '127.0.0.1:8080'.
#
# @param carbonserver_enabled
#   Whether to enable carbonserver. Default value: false.
#
# @param carbonserver_buckets
#   Buckets to track response times. Default value: 10 .
#
# @param carnonserver_metrics_as_counters
#   Carbonserver-specific metrics will be sent as counters for compatibility with grobian/carbonserver. Default value: false.
#
# @param carbonserver_read_timeout
#   Read timeout for HTTP server. Default value: '60s'.
#
# @param carbonserver_write_timeout
#   Write timeout for HTTP server. Default value: '60s'.
#
# @param carbonserver_query_cache_enabled
#   Enable /render cache, it will cache the result for 1 minute. Default value: true.
#
# @param carbonserver_query_cache_size_mb
#   0 for unlimited. Default value: 0 .
#
# @param carbonserver_find_cache_enabled
#   Enable /metrics/find cache, it will cache the result for 5 minutes. Default value: true.
#
# @param carbonserver_trigram_index
#   Control trigram index
#     This index is used to speed-up /find requests. However, it will lead to increased memory consumption
#     estimated memory consumption is approx. 500 bytes per each metric on disk. Another drawback is that
#     it will recreate index every scan-frequency interval all new/deleted metrics will still be searchable
#     until index is recreated
#   Default value: true.
#
# @param carbonserver_scan_frequency
#   Carbonserver keeps track of all available whisper files in memory. This determines how often it will check FS
#   for new or deleted metrics.
#   Default value: '5m0s'.
#
# @param carbonserver_max_globs
#   Maximum amount of globs in a single metric in index. This value is used to speed-up /find requests with
#   a lot of globs, but will lead to increased memory consumption.
#   Default value: 100 .
#
# @param carbonserver_fail_on_max_globs
#   Fail if amount of globs more than max-globs. Default value: false.
#
# @param carbonserver_graphite_web_10_strict_mode
#   Use Graphite-web 1.0 native structs for pickle response. This mode will break compatibility with graphite-web 0.9.x
#   If false, carbonserver won't send graphite-web 1.0 specific structs that might degrade performance of the cluster.
#   But will be compatible with both graphite-web 1.0 and 0.9.x .
#   Default value: true.
#
# @param carbonserver_internal_stats_dir
#   Allows to keep track for "last time readed" between restarts, leave empty to disable. Default value: ''.
#
# @param carbonserver_stats_percentiles
#   Calculate /render request time percentiles for the bucket, '95' means calculate 95th Percentile.
#   To disable this feature, leave the list blank.
#   Default value: [99, 98, 95, 75, 50].
#
# @param dump_enabled
#   Enable dump/restore function on USR2 signal. Default value: false.
#
# @param dump_path
#   Directory for store dump data. Should be writeable for carbon. Default value: '/var/lib/graphite/dump/'.
#
# @param dump_restore_per_second
#   Restore speed. 0 - unlimited. Default value: 0 .
#
# @param pprof_listen
#   Specifies the IP-Address with port for pprof. Default value: 'localhost:7007'.
#
# @param pprof_enabled
#   Whether to enable pprof. Default value: false.
#
# @param logging_logger
#   TODO
#
# @param logging_file
#   Log output: filename, "stderr", "stdout", "none", "" (same as "stderr"). Default value: '/var/log/go-carbon/go-carbon.log'.
#
# @param logging_level
#   Log level: "debug", "info", "warn", "error", "dpanic", "panic", and "fatal". Default value: 'info'.
#
# @param logging_encoding
#   Log format: "json", "console", "mixed". Default value: 'mixed'.
#
# @param logging_encoding_time
#   Log time format: "millis", "nanos", "epoch", "iso8601". Default value: 'iso8601'.
#
# @param logging_duration
#   Log duration format: "seconds", "nanos", "string". Default value: 'seconds'.
#
# @param storage_schemas_pattern
#   TODO
#
# @param storage_schemas_retentions
#   TODO
#
# @param storage_aggregation_pattern
#   TODO
#
# @param storage_aggregation_xfilesfactor
#   TODO
#
# @param storage_aggregation_aggregationmethod
#   TODO
#
class go_carbon(
  String $package_name,
  String $package_url,
  String $package_provider,
  Pattern[/^\d+(\.\d+){2}$/] $version,
  Stdlib::Absolutepath $conf_dir,
  #Stdlib::Absolutepath $log_dir,
  Optional[Integer[1]] $package_release,
  Optional[String] $user,

  Stdlib::Absolutepath $download_path,

  Stdlib::Ensure::Service $service_ensure,
  Boolean $service_enable,
  Boolean $download_package,
  Boolean $manage_package,

  #[go-carbon.conf]
  #[common]
  String $graph_prefix,
  String $metric_endpoint,
  String $metric_interval,
  Integer $max_cpu,

  #[whisper]
  Stdlib::Absolutepath $whisper_data_dir,
  Stdlib::Absolutepath $whisper_schemas_file,
  Stdlib::Absolutepath $whisper_aggregation_file,
  Integer $whisper_workers,
  Integer $whisper_max_updates_per_second,
  Integer $whisper_max_creates_per_second,
  Boolean $whisper_hard_max_creates_per_second,
  Boolean $whisper_sparse_create,
  Boolean $whisper_flock,
  Boolean $whisper_flock_enabled,
  Boolean $whisper_hash_filenames,

  #[cache]
  Integer $cache_max_size,
  String $cache_write_strategy,

  #[udp]
  Boolean $udp_enabled,
  Stdlib::Port $udp_port,
  Integer $udp_buffer_size,

  #[tcp]
  Boolean $tcp_enabled,
  Stdlib::Port $tcp_port,
  Integer $tcp_buffer_size,

  #[pickle]
  Boolean $pickle_enabled,
  Stdlib::Port $pickle_port,
  Integer $pickle_max_message_size,
  Integer $pickle_buffer_size,

  #[carbonlink]
  Boolean $carbonlink_enabled,
  String $carbonlink_listen,
  String $carbonlink_read_timeout,

  #[grpc]
  Boolean $grpc_enabled,
  String  $grpc_listen,

  #[tags]
  Boolean $tags_enabled,
  String $tagdb_url,
  Integer $tagdb_chunk_size,
  Integer $tagdb_update_interval,
  Stdlib::Absolutepath $tagdb_local_dir,
  String $tagdb_timeout,

  #[carbonserver]
  String $carbonserver_listen,
  Boolean $carbonserver_enabled,
  Integer $carbonserver_buckets,
  Boolean $carnonserver_metrics_as_counters,
  String $carbonserver_read_timeout,
  String $carbonserver_write_timeout,
  Boolean $carbonserver_query_cache_enabled,
  Integer $carbonserver_query_cache_size_mb,
  Boolean $carbonserver_find_cache_enabled,
  Boolean $carbonserver_trigram_index,
  String $carbonserver_scan_frequency,
  Integer $carbonserver_max_globs,
  Boolean $carbonserver_fail_on_max_globs,
  Boolean $carbonserver_graphite_web_10_strict_mode,
  String $carbonserver_internal_stats_dir,
  Array[Integer, 5] $carbonserver_stats_percentiles,

  #[dump]
  Boolean $dump_enabled,
  Stdlib::Absolutepath $dump_path,
  Integer $dump_restore_per_second,

  #[pprof]
  String  $pprof_listen,
  Boolean $pprof_enabled,

  #[logging]
  String $logging_logger,
  Stdlib::Absolutepath $logging_file,
  String $logging_level,
  String $logging_encoding,
  String $logging_encoding_time,
  String $logging_duration,

  #[storage-schemas]
  String $storage_schemas_pattern,
  String $storage_schemas_retentions,

  #[storage-aggregation]
  String $storage_aggregation_pattern,
  String $storage_aggregation_xfilesfactor,
  String $storage_aggregation_aggregationmethod,
  ){

  contain ::go_carbon::install
  contain ::go_carbon::config
  contain ::go_carbon::service

  Class['go_carbon::install']
    -> Class['go_carbon::config']
    ~> Class['go_carbon::service']
}

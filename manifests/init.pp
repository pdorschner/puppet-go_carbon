# == class: go_carbon
#
# Main class, includes all other classes.
#
# === Parameters
#
# @param $ensure

class go_carbon(
  String                     $package_name,
  String                     $package_url,
  String                     $package_provider,
  Pattern[/^\d+(\.\d+){2}$/] $version,
  Stdlib::Absolutepath       $conf_dir,
  Stdlib::Absolutepath       $log_dir,
  Optional[Integer[1]]       $package_release,
  Optional[String]           $user,
  Optional[String]           $group,

  Stdlib::Absolutepath $download_path,

  Stdlib::Ensure::Service $ensure,
  Boolean                 $enable,
  Boolean                 $download_package,
  Boolean                 $manage_package,

  #[go-carbon.conf]
  #[common]
  String  $graph_prefix,
  String  $metric_endpoint,
  String  $metric_interval,
  Integer $max_cpu,

  #[whisper]
  Stdlib::Absolutepath $whisper_data_dir,
  Stdlib::Absolutepath $whisper_schemas_file,
  Stdlib::Absolutepath $whisper_aggregation_file,
  Integer              $whisper_workers,
  Integer              $whisper_max_updates_per_second,
  Integer              $whisper_max_creates_per_second,
  Boolean              $whisper_hard_max_creates_per_second,
  Boolean              $whisper_sparse_create,
  Boolean              $whisper_flock,
  Boolean              $whisper_flock_enabled,
  Boolean              $whisper_hash_filenames,

  #[cache]
  Integer $cache_max_size,
  String  $cache_write_strategy,

  #[udp]
  Boolean      $udp_enabled,
  Stdlib::Port $udp_port,
  Integer      $udp_buffer_size,

  #[tcp]
  Boolean      $tcp_enabled,
  Stdlib::Port $tcp_port,
  Integer      $tcp_buffer_size,

  #[pickle]
  Boolean      $pickle_enabled,
  Stdlib::Port $pickle_port,
  Integer      $pickle_max_message_size,
  Integer      $pickle_buffer_size,

  #[carbonlink]
  Boolean $carbonlink_enabled,
  String  $carbonlink_listen,
  String  $carbonlink_read_timeout,

  #[grpc]
  Boolean $grpc_enabled,
  String  $grpc_listen,

  #[tags]
  Boolean              $tags_enabled,
  String               $tagdb_url,
  Integer              $tagdb_chunk_size,
  Integer              $tagdb_update_interval,
  Stdlib::Absolutepath $tagdb_local_dir,
  String               $tagdb_timeout,

  #[carbonserver]
  String            $carbonserver_listen,
  Boolean           $carbonserver_enabled,
  Integer           $carbonserver_buckets,
  Boolean           $carnonserver_metrics_as_counters,
  String            $carbonserver_read_timeout,
  String            $carbonserver_write_timeout,
  Boolean           $carbonserver_query_cache_enabled,
  Integer           $carbonserver_query_cache_size_mb,
  Boolean           $carbonserver_find_cache_enabled,
  Boolean           $carbonserver_trigram_index,
  String            $carbonserver_scan_frequency,
  Integer           $carbonserver_max_globs,
  Boolean           $carbonserver_fail_on_max_globs,
  Boolean           $carbonserver_graphite_web_10_strict_mode,
  String            $carbonserver_internal_stats_dir,
  Array[Integer, 5] $carbonserver_stats_percentiles,

  #[dump]
  Boolean              $dump_enabled,
  Stdlib::Absolutepath $dump_path,
  Integer              $dump_restore_per_second,

  #[pprof]
  String  $pprof_listen,
  Boolean $pprof_enabled,

  #[logging]
  String               $logging_logger,
  Stdlib::Absolutepath $logging_file,
  String               $logging_level,
  String               $logging_encoding,
  String               $logging_encoding_time,
  String               $logging_duration,

  ##[storage-schemas.conf]
  #Array                      $storage_schemas                          = [
  #                             {
  #                               name       => 'default',
  #                               pattern    => '.*',
  #                               retentions => '60s:30d,1h:5y'
  #                             },
  #                           ],

  #[storage-aggregation.conf]
  #Array                      $storage_aggreation                       = [
  #                             name             => 'default',
  #                             pattern          => '.*',
  #                             xfilesfactor     => '0.5',
  #                             aggreationmethod => 'average'
  #                           ]
  ){
  Class['go_carbon::install']
    -> Class['go_carbon::config']
    ~> Class['go_carbon::service']

  contain ::go_carbon::install
  contain ::go_carbon::config
  contain ::go_carbon::service
}

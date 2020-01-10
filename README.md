# go_carbon

Welcome to your new module. A short overview of the generated parts can be found in the PDK documentation at https://puppet.com/pdk/latest/pdk_generating_modules.html .

The README template below provides a starting point with details about what information to include in your README.

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with go_carbon](#setup)
    * [What go_carbon affects](#what-go_carbon-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with go_carbon](#beginning-with-go_carbon)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

Briefly tell users why they might want to use your module. Explain what your module does and what kind of problems users can solve with it.

This should be a fairly short description helps the user decide if your module is what they want.

## Setup

### What go_carbon affects **OPTIONAL**

If it's obvious what your module touches, you can skip this section. For example, folks can probably figure out that your mysql_instance module affects their MySQL instances.

If there's more that they should know about, though, this is the place to mention:

* Files, packages, services, or operations that the module will alter, impact, or execute.
* Dependencies that your module automatically installs.
* Warnings or other important notices.

### Setup Requirements **OPTIONAL**

If your module requires anything extra before setting up (pluginsync enabled, another module, etc.), mention it here.

If your most recent release breaks compatibility or requires particular steps for upgrading, you might want to include an additional "Upgrading" section here.

### Beginning with go_carbon

The very basic steps needed for a user to get the module up and running. This can include setup steps, if necessary, or it can be an example of the most basic use of the module.

## Usage

Include usage examples for common use cases in the **Usage** section. Show your users how to use your module to solve problems, and be sure to include code examples. Include three to five examples of the most important or common tasks a user can accomplish with your module. Show users how to accomplish more complex tasks that involve different types, classes, and functions working in tandem.

## Reference

## Table of Contents

**Classes**

* [`go_carbon`](#go_carbon): go_carbon  Main class, includes all other classes.
* [`go_carbon::config`](#go_carbonconfig): 
* [`go_carbon::install`](#go_carboninstall): 
* [`go_carbon::service`](#go_carbonservice): 

## Classes

### go_carbon

go_carbon

Main class, includes all other classes.

* **Note** carbonserver is not intended to fully replace graphite-web it acts as a "REMOTE_STORAGE" for graphite-web or carbonzipper/carbonapi.
Carbonserver support is still experimental and may contain bugs or be incompatible with github.com/grobian/carbonserver

#### Parameters

The following parameters are available in the `go_carbon` class.

##### `version`

Data type: `Pattern[/^\d+(\.\d+){2}$/]`

Specifies the package version for go-carbon. Default value: 0.14.0 .

##### `conf_dir`

Data type: `Stdlib::Absolutepath`

Specifies a directory for go-carbon's configuration files. Default value: '/etc/go-carbon'.

##### `log_dir`

Specifies the log file destination for go-carbon logs. Default value: '/var/log/go-carbon'.

##### `user`

Data type: `Optional[String]`

Run as user. Works only in daemon mode. Default value: 'carbon'

##### `download_path`

Data type: `Stdlib::Absolutepath`

Specifies the destination of the downloaded package. Default value: '/tmp'.

##### `ensure`

Data type: `Stdlib::Ensure::Service`

Wheter the go-carbon service should be running. Default value: 'running'.

##### `enable`

Wheter to enable the go-carbon service at boot. Default value: true.

##### `download_package`

Data type: `Boolean`

Specifies to download the go-carbon package from GitHub. Default value: false.

##### `graph_prefix`

Data type: `String`

Prefix for store all internal go-carbon graphs. Supported macroses: {host}. Default value: 'carbon.agents.{host}'.

##### `metric_endpoint`

Data type: `String`

Endpoint for store internal carbon metrics. Valid values: "" or "local", "tcp://host:port", "udp://host:port".
Default value: 'local'.

##### `metric_interval`

Data type: `String`

Interval of storing internal metrics. Like CARBON_METRIC_INTERVAL. Default value: '1m0s'.

##### `max_cpu`

Data type: `Integer`

Increase for configuration with multi persister workers. Default value: 4.

##### `whisper_data_dir`

Data type: `Stdlib::Absolutepath`

Specifies the directory of whisper. Default value: '/var/lib/graphite/whisper'.

##### `whisper_schemas_file`

Data type: `Stdlib::Absolutepath`

Specifies the directory of whisper storage schemas file. Default value: '/etc/go-carbon/storage-schemas.conf'.

##### `whisper_aggregation_file`

Data type: `Stdlib::Absolutepath`

Specifies the directory of whisper storage aggreation file. Default value: '/etc/go-carbon/storage-aggregation.conf'.

##### `whisper_workers`

Data type: `Integer`

Worker threads count. Metrics sharded by "crc32(metricName) % workers". Default value: 8

##### `whisper_max_updates_per_second`

Data type: `Integer`

Limits the number of whisper update_many() calls per second. 0 - no limit. Default value: 0

##### `whisper_max_creates_per_second`

Data type: `Integer`

Softly limits the number of whisper files that get created each second. 0 - no limit. Default value: 0

##### `whisper_hard_max_creates_per_second`

Data type: `Boolean`

Make max-creates-per-second a hard limit. Extra new metrics are dropped. A hard throttle of 0 drops all new metrics.
Default value: false.

##### `whisper_sparse_create`

Data type: `Boolean`

Sparse file creation. Default value: false.

##### `whisper_flock`

Data type: `Boolean`

Use flock on every file call (ensures consistency if there are concurrent read/writes to the same file). Default value: true.

##### `whisper_flock_enabled`

Data type: `Boolean`

Use flock on every file call (ensures consistency if there are concurrent read/writes to the same file). Default value: true.

##### `whisper_hash_filenames`

Data type: `Boolean`

Use hashed filenames for tagged metrics instead of human readable. Default value: true.

##### `cache_max_size`

Data type: `Integer`

Limit of in-memory stored points (not metrics). Default value: 1000000 .

##### `cache_write_strategy`

Data type: `String`

Capacity of queue between receivers and cache
Strategy to persist metrics. Values: "max","sorted","noop".
  "max" - write metrics with most unwritten datapoints first
  "sorted" - sort by timestamp of first unwritten datapoint.
  "noop" - pick metrics to write in unspecified order,
           requires least CPU and improves cache responsiveness
Default value: 'max'.

##### `udp_enabled`

Data type: `Boolean`

Enables upd. Default value: true.

##### `udp_port`

Data type: `Stdlib::Port`

Specifies the port for udp. Default value: ':2003'.

##### `udp_buffer_size`

Data type: `Integer`

Optional internal queue between receiver and cache. Default value: 0 .

##### `tcp_enabled`

Data type: `Boolean`

Enables tcp. Default value: true.

##### `tcp_port`

Data type: `Stdlib::Port`

Specifies the port for tcp. Default value: ':2003'

##### `tcp_buffer_size`

Data type: `Integer`

Optional internal queue between receiver and cache. Default value: 0 .

##### `pickle_enabled`

Data type: `Boolean`

Whether to enable pickle. Default value: true.

##### `pickle_port`

Data type: `Stdlib::Port`

Specifies the port for pickle. Default value: ':2004'.

##### `pickle_max_message_size`

Data type: `Integer`

Limit message size for prevent memory overflow. Default value: 67108864 .

##### `pickle_buffer_size`

Data type: `Integer`

Optional internal queue between receiver and cache. Default value: 0 .

##### `carbonlink_enabled`

Data type: `Boolean`

Whether to enable carbonlink. Default value: true.

##### `carbonlink_listen`

Data type: `String`

Specifies the IP-Address with port for carbonlink. Defaul value: '127.0.0.1:7002'.

##### `carbonlink_read_timeout`

Data type: `String`

Close inactive connections after "read-timeout". Default value: '30s'.

##### `grpc_enabled`

Data type: `Boolean`

Whether to enable grpc api. Default value: true.

##### `grpc_listen`

Data type: `String`

Specifies the IP-Address with port for grpc api. Default value: '127.0.0.1:7003'.

##### `tags_enabled`

Data type: `Boolean`

Whether to enable tags. Default value: false.

##### `tagdb_url`

Data type: `String`

TagDB url. It should support /tags/tagMultiSeries endpoint. Default value: 'http://127.0.0.1:8000'.

##### `tagdb_chunk_size`

Data type: `Integer`

TODO

##### `tagdb_update_interval`

Data type: `Integer`

TODO

##### `tagdb_local_dir`

Data type: `Stdlib::Absolutepath`

Directory for send queue (based on leveldb). Default value: '/var/lib/graphite/tagging/'.

##### `tagdb_timeout`

Data type: `String`

POST timeout. Default value: '1s'.

##### `carbonserver_listen`

Data type: `String`

Specifies the IP-Address with port for carbonserver. Default value: '127.0.0.1:8080'.

##### `carbonserver_enabled`

Data type: `Boolean`

Whether to enable carbonserver. Default value: false.

##### `carbonserver_buckets`

Data type: `Integer`

Buckets to track response times. Default value: 10 .

##### `carnonserver_metrics_as_counters`

Data type: `Boolean`

Carbonserver-specific metrics will be sent as counters for compatibility with grobian/carbonserver. Default value: false.

##### `carbonserver_read_timeout`

Data type: `String`

Read timeout for HTTP server. Default value: '60s'.

##### `carbonserver_write_timeout`

Data type: `String`

Write timeout for HTTP server. Default value: '60s'.

##### `carbonserver_query_cache_enabled`

Data type: `Boolean`

Enable /render cache, it will cache the result for 1 minute. Default value: true.

##### `carbonserver_query_cache_size_mb`

Data type: `Integer`

0 for unlimited. Default value: 0 .

##### `carbonserver_find_cache_enabled`

Data type: `Boolean`

Enable /metrics/find cache, it will cache the result for 5 minutes. Default value: true.

##### `carbonserver_trigram_index`

Data type: `Boolean`

Control trigram index
  This index is used to speed-up /find requests. However, it will lead to increased memory consumption
  estimated memory consumption is approx. 500 bytes per each metric on disk. Another drawback is that
  it will recreate index every scan-frequency interval all new/deleted metrics will still be searchable
  until index is recreated
Default value: true.

##### `carbonserver_scan_frequency`

Data type: `String`

Carbonserver keeps track of all available whisper files in memory. This determines how often it will check FS
for new or deleted metrics.
Default value: '5m0s'.

##### `carbonserver_max_globs`

Data type: `Integer`

Maximum amount of globs in a single metric in index. This value is used to speed-up /find requests with
a lot of globs, but will lead to increased memory consumption.
Default value: 100 .

##### `carbonserver_fail_on_max_globs`

Data type: `Boolean`

Fail if amount of globs more than max-globs. Default value: false.

##### `carbonserver_graphite_web_10_strict_mode`

Data type: `Boolean`

Use Graphite-web 1.0 native structs for pickle response. This mode will break compatibility with graphite-web 0.9.x
If false, carbonserver won't send graphite-web 1.0 specific structs that might degrade performance of the cluster.
But will be compatible with both graphite-web 1.0 and 0.9.x .
Default value: true.

##### `carbonserver_internal_stats_dir`

Data type: `String`

Allows to keep track for "last time readed" between restarts, leave empty to disable. Default value: ''.

##### `carbonserver_stats_percentiles`

Data type: `Array[Integer, 5]`

Calculate /render request time percentiles for the bucket, '95' means calculate 95th Percentile. To disable this feature, leave the list blank.
Default value: [99, 98, 95, 75, 50].

##### `dump_enabled`

Data type: `Boolean`

Enable dump/restore function on USR2 signal. Default value: false.

##### `dump_path`

Data type: `Stdlib::Absolutepath`

Directory for store dump data. Should be writeable for carbon. Default value: '/var/lib/graphite/dump/'.

##### `dump_restore_per_second`

Data type: `Integer`

Restore speed. 0 - unlimited. Default value: 0 .

##### `pprof_listen`

Data type: `String`

Specifies the IP-Address with port for pprof. Default value: 'localhost:7007'.

##### `pprof_enabled`

Data type: `Boolean`

Whether to enable pprof. Default value: false.

##### `logging_logger`

Data type: `String`

TODO

##### `logging_file`

Data type: `Stdlib::Absolutepath`

Log output: filename, "stderr", "stdout", "none", "" (same as "stderr"). Default value: '/var/log/go-carbon/go-carbon.log'.

##### `logging_level`

Data type: `String`

Log level: "debug", "info", "warn", "error", "dpanic", "panic", and "fatal". Default value: 'info'.

##### `logging_encoding`

Data type: `String`

Log format: "json", "console", "mixed". Default value: 'mixed'.

##### `logging_encoding_time`

Data type: `String`

Log time format: "millis", "nanos", "epoch", "iso8601". Default value: 'iso8601'.

##### `logging_duration`

Data type: `String`

Log duration format: "seconds", "nanos", "string". Default value: 'seconds'.

##### `storage_schemas_pattern`

Data type: `String`

TODO

##### `storage_schemas_retentions`

Data type: `String`

TODO

##### `storage_aggregation_pattern`

Data type: `String`

TODO

##### `storage_aggregation_xfilesfactor`

Data type: `String`

TODO

##### `storage_aggregation_aggregationmethod`

Data type: `String`

TODO

##### `package_name`

Data type: `String`



##### `package_url`

Data type: `String`



##### `package_provider`

Data type: `String`



##### `package_release`

Data type: `Optional[Integer[1]]`



##### `manage_package`

Data type: `Boolean`



### go_carbon::config

The go_carbon::config class.

### go_carbon::install

The go_carbon::install class.

### go_carbon::service

The go_carbon::service class.


## Limitations

In the Limitations section, list any incompatibilities, known issues, or other warnings.

## Development

In the Development section, tell other users the ground rules for contributing to your project and how they should submit their work.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should consider using changelog). You can also add any additional sections you feel are necessary or important to include here. Please use the `## ` header.

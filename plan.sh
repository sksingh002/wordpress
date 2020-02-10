pkg_name=wordpress
pkg_origin=sksingh002
pkg_version="4.0"  #httpd-2.2.3.tar.gz
pkg_maintainer="Saurabh Kr Singh <sksingh002@gmail.com>"
pkg_license=("Apache-2.0")
pkg_source="https://wordpress.org/${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="03a8437ca9ae14c9a7f6d4062672e9685d45e1aaad6c020af2673cb42a34c0ac"

pkg_deps=(
  sksingh002/httpd
  sksingh002/php
)

source_dir=$HAB_CACHE_SRC_PATH/${pkg_name}

pkg_svc_user="root"
pkg_svc_run="php-fpm --nodaemonize"

pkg_exports=(
   [port]=http.listen.port
   [local_only]=http.listen.local_only
)

pkg_binds=(
  [database]="host port username password database"
  [php]="port database"
)

do_build() {
  return 0
}

do_install() {
  cp -r "$source_dir" "$pkg_prefix/public_html/"
}
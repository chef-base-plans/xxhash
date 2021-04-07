# This file is the heart of your application's habitat.
# See full docs at https://www.habitat.sh/docs/reference/plan-syntax/

pkg_name=xxHash

pkg_origin=duddela_tryhabitat

pkg_version="0.8.0"

pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"

pkg_license=("Apache-2.0")

pkg_shasum="TODO"

pkg_deps=(core/glibc)

pkg_build_deps=(core/make core/gcc core/git)

pkg_upstream_url="https://github.com/Cyan4973/xxHash"

do_begin() {
  do_default_begin
}

do_download() {
    repo_path="${HAB_CACHED_SRC_PATH}/${pkg_dirname}"
    rm -Rf "${repo_path}"
    git clone "${pkg_upstream_url}" "${repo_path}"
	( cd "${HAB_CACHED_SRC_PATH}/${pkg_dirname}" || exit
    git checkout tags/"v$pkg_version"
  )
}

do_clean() {
  do_default_clean
}

do_build() {
  cd "${HAB_CACHED_SRC_PATH}/${pkg_dirname}"
  make
}

do_check() {
  return 0
}

do_install() {
  cd "${HAB_CACHED_SRC_PATH}/${pkg_dirname}"
  make install
}

do_end() {
  do_default_end
}

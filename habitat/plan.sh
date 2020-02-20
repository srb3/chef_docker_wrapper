scaffold_policy_name=Policyfile
pkg_name=chef_docker_wrapper
pkg_origin=srb3
pkg_version="0.1.0"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("Apache-2.0")
pkg_scaffolding="chef/scaffolding-chef-infra"
pkg_deps=(core/glibc)
pkg_build_deps=(core/make core/gcc)

do_build() {
  do_default_build
}

do_install() {
  do_default_install
}

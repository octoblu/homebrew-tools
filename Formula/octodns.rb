class Octodns < Formula
  VERSION = "2.0.4"
  BIN_FILES = ["octodns", "octodns-alias", "octodns-srv"]

  desc "Update Octoblu DNS records"
  url "https://github.com/octoblu/ops-tools-octodns/archive/v#{VERSION}.tar.gz"
  sha256 "5d26e790ae80d33dcb3dee65a753f63243b069bae697c24b90f85b9d4a189308"
  depends_on 'jq'

  def install
    # Replace VERSION
    inreplace "octodns", '# HOMEBREW HOOK: early return version', "echo \"#{VERSION}\" && return 0"
    inreplace "octodns-alias", '# HOMEBREW HOOK: early return version', "echo \"#{VERSION}\" && return 0"
    inreplace "octodns-srv", '# HOMEBREW HOOK: early return version', "echo \"#{VERSION}\" && return 0"

    # Replace subcommand paths
    inreplace "octodns", '# HOMEBREW HOOK: early return action', "echo -n \"#{prefix}/octodns-$action\" && return 0"

    bin.install "octodns"
    prefix.install "octodns-alias"
    prefix.install "octodns-srv"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/octodns --version").strip
    assert_equal "#{VERSION}", shell_output("#{bin}/octodns alias --version").strip
    assert_equal "#{VERSION}", shell_output("#{bin}/octodns srv --version").strip
  end
end

class Octodns < Formula
  VERSION = "3.0.0"
  BIN_FILES = ["octodns", "octodns-alias", "octodns-srv"]

  desc "Update Octoblu DNS records"
  url "https://github.com/octoblu/ops-tools-octodns/archive/v#{VERSION}.tar.gz"
  sha256 "058042201d136d5c22ac24494dc4e958c8e02d1ed1db546d398685734dc113d1"
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

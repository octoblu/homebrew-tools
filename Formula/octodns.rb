class Octodns < Formula
  VERSION = "1.0.0"

  desc "Update Octoblu DNS records"
  url "https://github.com/octoblu/ops-tools-octodns/archive/v#{VERSION}.tar.gz"
  sha256 "cfb491a5e8339aa404bb4c59c10a18c7dcadf8e4551a05a2619ad5dbc7888190"
  depends_on 'jq'

  def install
    inreplace "octodns.sh", 'directory="$(script_directory)"', "echo \"#{VERSION}\" && return 0"

    move "octodns.sh", "octodns"

    bin.install "octodns"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/octodns --version").strip
  end
end

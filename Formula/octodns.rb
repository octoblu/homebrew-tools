class Octodns < Formula
  VERSION = "1.0.1"

  desc "Update Octoblu DNS records"
  url "https://github.com/octoblu/ops-tools-octodns/archive/v#{VERSION}.tar.gz"
  sha256 "08dc291c8c30de2df4f44454cece3279777f6505c05150699748e702d54bcbb8"
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

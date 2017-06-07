class Octopingdom < Formula
  VERSION = "2.1.2"

  desc "Update Octoblu Pingdom checks"
  url "https://github.com/octoblu/ops-tools-octopingdom/archive/v#{VERSION}.tar.gz"
  sha256 "7b90e60cf751aa99d9faf79163607951c473757c663047fb04fd472e2edc18f3"
  depends_on 'jq'

  def install
    # Replace VERSION
    inreplace "octopingdom", '# HOMEBREW HOOK: early return version', "echo \"#{VERSION}\" && return 0"
    bin.install "octopingdom"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/octopingdom --version").strip
  end
end

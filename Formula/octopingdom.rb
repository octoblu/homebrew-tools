class Octopingdom < Formula
  VERSION = "2.1.1"

  desc "Update Octoblu Pingdom checks"
  url "https://github.com/octoblu/ops-tools-octopingdom/archive/v#{VERSION}.tar.gz"
  sha256 "40aeb17e333b9360784bab08903ce8db28169a455841b96b7ac3e41bfde3efdd"
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

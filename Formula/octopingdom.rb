class Octopingdom < Formula
  VERSION = "2.1.0"

  desc "Update Octoblu Pingdom checks"
  url "https://github.com/octoblu/ops-tools-octopingdom/archive/v#{VERSION}.tar.gz"
  sha256 "778b73c54f5117abe2b734d24946ae8d0600d940796c8d845d0dcaa0c1d8c2e9"
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

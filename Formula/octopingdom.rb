class Octopingdom < Formula
  VERSION = "1.0.0"

  desc "Update Octoblu Pingdom checks"
  url "https://github.com/octoblu/ops-tools-octopingdom/archive/v#{VERSION}.tar.gz"
  sha256 "fe2f854a14a977c21398d8227e30148d9061b55d16dad2fba96e286b7d5fac03"
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

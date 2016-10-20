class EnsureProject < Formula
  VERSION = "1.0.0"

  desc "Make sure a project exists and is up to date"
  url "https://github.com/octoblu/unix-dev-tools-ensure-project/archive/v#{VERSION}.tar.gz"
  sha256 "949965a135f694996438f02e521267fab2bfbe2b796c68678fb5181f0a42c1fa"

  def install
    inreplace "ensure-project", 'local directory="$(script_directory)"', ""
    inreplace "ensure-project", 'echo "unknown"', "echo '#{VERSION}'"

    bin.install "ensure-project"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/ensure-project --version").strip
  end
end

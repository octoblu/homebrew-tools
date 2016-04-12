class Semver < Formula
  desc "semver bash implementation"
  homepage "https://github.com/fsaintjacques/semver-tool"
  url "https://github.com/fsaintjacques/semver-tool/archive/1.2.0.tar.gz"
  sha256 "f8a070146e29c3bee4e031e0cb12aa4f6cf42cefac5a5dfc33aa35ac53320a73"

  def install
    bin.install "src/semver"
  end

  test do
    assert_equal "semver: 1.2.0", shell_output("#{bin}/semver --version").strip
  end
end

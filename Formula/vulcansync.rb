class Vulcansync < Formula
  VERSION = "2.1.1"

  desc "Sync vulcand frontends, backends, and middlewares to the major cluster"
  homepage "https://github.com/octoblu/ops-tools-vulcansync"
  url "https://github.com/octoblu/ops-tools-vulcansync/archive/v#{VERSION}.tar.gz"
  sha256 "d6c6a7f550f7ef71305724e752e9d5fc3870426a85b2aaa1f789f0076ef05254"

  depends_on 'octoblu/tools/vctl'

  def install
    inreplace "vulcansync.sh", 'local directory="$(script_directory)"', ""
    inreplace "vulcansync.sh", 'local version=$(cat "$directory/VERSION")', "local version=\"#{VERSION}\""

    move "vulcansync.sh", "vulcansync"

    bin.install "vulcansync"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/vulcansync --version").strip
  end
end

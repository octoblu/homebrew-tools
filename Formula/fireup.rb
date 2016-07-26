class Fireup < Formula
  VERSION = "1.0.0"

  desc "Fireup a project"
  url "https://github.com/octoblu/unix-dev-tools-fireup/archive/v#{VERSION}.tar.gz"
  sha256 "e272e2ef48bb7bcb63d5936f85e94e03a40e891d3d28f0597145152dad9ededf"

  def install
    inreplace "fireup.sh", 'local directory="$(script_directory)"', ""
    inreplace "fireup.sh", 'local version=$(cat "$directory/VERSION")', "local version=\"#{VERSION}\""

    move "fireup.sh", "fireup"

    bin.install "fireup"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/fireup --version").strip
  end
end

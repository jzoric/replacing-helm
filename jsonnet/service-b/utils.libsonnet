// Return a hashed data md5
{
  hashed(data):: (
    std.substr(std.md5(std.toString(data)), 0, 7)
  ),
}

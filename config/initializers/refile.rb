require "refile/s3"

aws = {
  access_key_id: ENV["ACCESS_KEY_ID"],
  secret_access_key: ENV["SECRET_ACCESS_KEY"],
  s3_endpoint: "s3-ap-northeast-1.amazonaws.com",
  region: "sa-east-1",
  bucket: "takeloca",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
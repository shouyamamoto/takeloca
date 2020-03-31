require "refile/s3"

aws = {
  access_key_id: "AKIAIAVJ2VXA2BWMUMDQ",
  secret_access_key: "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",
  region: "sa-east-1",
  bucket: "takeloca",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
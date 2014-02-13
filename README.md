World cities database.
===========================

Cleaned-up and Rails adapted version of MaxMind DB.
Removed obsolete countries (Zair, etc), add regions & countries migration.

To use in Rails app:

1. Copy migrations and run them.
2. Copy fixtures and seed with seed_fu or other gems.
3. Modify the rake task to point to gzipped version of locations.csv.gz, for example upload to S3.
4. Run rake task with rake db:seed:locations.

To see what has changed in recent versions, see the [CHANGELOG](https://github.com/evrone/worldcities/blob/master/CHANGELOG.md).

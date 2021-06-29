# ksqldb-migrations-action

This repository demonstrates the use of GitHub Actions to perform [schema migrations](https://docs.ksqldb.io/en/latest/operate-and-deploy/migrations-tool/) upon a ksqlDB cluster running in [Confluent Cloud](https://www.confluent.io/confluent-cloud/).

**➡️ Check out [the companion blog post](https://www.confluent.io/blog/easily-manage-database-migrations-with-evolving-schemas-in-ksqldb/) for the full story**

### Repository structure

* 📁 `.github/actions/`
  * 📁 `ksqldb-migrations-validate/`
    * 📄 `action.yaml` Validates pending ksqlDB migrations against the state of the ksqlDB cluster
  * 📁 `ksqldb-migrations-apply/`
    * 📄 `action.yaml` Applies pending ksqlDB migrations
* 📁 `migrations/...`
  * 📃 SQL files that define individual migrations
* 📄 `ksql-migrations.properties` Configures the migration tool's connection to the ksqlDB cluster

### How it works

The workflow defined in `.github/workflows/migrate-cloud-ksqldb.yaml` is triggered based on pushes to the main branch.
It:
1. checks out the current commit
1. substitutes configuration variables with secrets
1. validates the migration files as of the current commit against the migrations already applied to the ksqlDB cluster
1. (assuming validation passes) applies all pending migrations to the ksqlDB cluster

### Try it on your own ksqlDB cluster

* Fork this repository.
* Follow the [ksqlDB quickstart](https://ksqldb.io/quickstart-cloud.html) to create a Confluent ksqlDB cluster and API key.
* Make a copy of `ksql-migrations.properties` named `ksql-migrations.local.properties`. Substitute the variables with your cluster's endpoint, API key, and API secret. Do not commit `ksql-migrations.local.properties`.
* Based on [ksql-migrations documentation](https://docs.ksqldb.io/en/latest/operate-and-deploy/migrations-tool/), initialize the migrations metadata. Pass the local configuration file to the command with `--config ksql-migrations.local.properties`.
* [Create GitHub secrets](https://docs.github.com/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets) for the ksqlDB cluster endpoint, API key, and API secret respectively named:
  * `CONFLUENT_KSQLDB_ENDPOINT`
  * `CONFLUENT_KSQLDB_API_KEY`
  * `CONFLUENT_KSQLDB_API_SECRET`
* Start committing migrations!

_Note: This demo assumes your ksqlDB cluster is running on Confluent Cloud. The configuration can be altered to work with ksqlDB clusters running elsewhere, provided that the GitHub Action can reach the cluster over the internet._

# DEPLOY PACKAGE RENDERER   

When you and/or your team are done with what you were doing,
use this script to generate files and folders between two of GIT commits. This comes pretty handy on a long run projects and there are a number of committed files from your first commit and your last commit.

By default, the destination folder is set to your Desktop, where a 'deploy' folder will be created with all files specified by two commit IDs.

I wrote this script because a lot of live websites I was working on were servers with FTP accounts only.

## So, how to use it?

Open your terminal, go to directory of where you have this script is located and run:

```sh
sh path/to/where/is/located/deploy_package_renderer.sh $1 $2 $3
```

where:
- $1 - relative/absolute path to where your GIT repository of your project is.
- $2 - commit ID of the **first** commit that is to be taken into consideration
- $3 - commit ID of the **last** commit that is to be taken into consideration

Here is an example:

```sh
sh ~/scripts/deploy_package_renderer.sh /var/www/workspace/myproject abcd123 dcba321
```

When the script is done, open your Desktop folder, 'deploy' folder is waiting for you.
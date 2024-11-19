#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <feature_name>"
    exit 1
fi

feature_name=$1
# Convert feature name to PascalCase for class names
feature_pascal_case=$(echo "$feature_name" | sed -r 's/(^|-)(\w)/\U\2/g')

# Create directory structure
mkdir -p "$feature_name"/{datalayer/{model/{request,response},service,repository,usecase},presentationlayer}

# File paths
remote_file="$feature_name/datalayer/service/${feature_name}_remote.dart"
repository_file="$feature_name/datalayer/repository/${feature_name}_repository.dart"
usecase_file="$feature_name/datalayer/usecase/get_${feature_name}_usecase.dart"

# Create Remote file
cat > "$remote_file" <<EOL
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../Constants.dart';
import '../model/response/all_blogs_model.dart';
part '${feature_name}_remote.g.dart';

@RestApi(baseUrl: baseurl)
abstract class ${feature_pascal_case}Remote {
  factory ${feature_pascal_case}Remote(Dio dio, {String? baseUrl}) = _${feature_pascal_case}Remote;

  @GET('/example')
  Future<List<Model>> getData();
}
EOL

# Create Repository file
cat > "$repository_file" <<EOL
abstract class ${feature_pascal_case}Repo {
   Future<List<Model>> function2();
}

@override
class ${feature_pascal_case}RepoImpl implements ${feature_pascal_case}Repo {
  final ${feature_pascal_case}Remote remote;

  ${feature_pascal_case}RepoImpl(this.remote);

  @override
  Future<List<Model>> function2() {
    return remote.getData();
  }
}
EOL

# Create UseCase file
cat > "$usecase_file" <<EOL
class Get${feature_pascal_case}UseCase {
  final ${feature_pascal_case}Repo repository;

  Get${feature_pascal_case}UseCase(this.repository);

  Future<List<Model>> execute() {
    return repository.function2();
  }
}
EOL

echo "Feature '$feature_name' structure created successfully!"

# Warning, hardwired path to fbcv Jenkins build!  (surely better if this is passed by Jenkins?!)
export FBCV_WS_PATH=$JENKINS_HOME/workspace/FBcv_SF/ontologies
export FBCV_BUILD_PATH=$JENKINS_HOME/workspace/FBcv_SF/oort

# Updating of imports from GO currently uses the default update mechanism in oort using the -simple pre-reasoned version. This assumes that all GO term usage will be in fbcv-edit.obo (!!)

ontology-release-runner --reasoner elk $FBCV_WS_PATH/fbcv-edit.obo --allow-equivalent-pairs go-simple.obo  --no-subsets --allow-overwrite --outdir oort  

##  Adding a second experimental round to make an owl import module file instead.
export OBO=http://purl.obolibrary.org/obo
## See https://code.google.com/p/owltools/wiki/OortExtractingModules for some clues about how this magic works:

owltools $FBCV_BUILD_PATH/fbcv-non-classified.owl go-simple.owl --add-imports-from-supports --extract-module -c -s $OBO/go/go-simple.owl --set-ontology-id $OBO/my/fbcv_go_import.owl -o fbcv_go_import.owl  # trying to use web version as source 


 
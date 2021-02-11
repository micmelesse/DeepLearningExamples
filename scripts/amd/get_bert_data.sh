export BERT_PREP_WORKING_DIR=/workspace/bert/data
cd /workspace
git clone https://github.com/attardi/wikiextractor.git && cd wikiextractor && git checkout 6408a430fc504a38b04d37ce5e7fc740191dee16 && cd ..
cd /workspace/bert
sh data/create_datasets_from_start.sh

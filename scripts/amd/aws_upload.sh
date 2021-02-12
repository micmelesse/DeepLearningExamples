sudo apt update
sudo apt-get install awscli unzip -y
# upload to aws
SRC=/home/mmelesse/dockerx/DeepLearningExamples/PyTorch/LanguageModeling/BERT/data/hdf5_lower_case_1_seq_len_128_max_pred_20_masked_lm_prob_0.15_random_seed_12345_dupe_factor_5
# SRC=/home/mmelesse/dockerx/DeepLearningExamples/PyTorch/LanguageModeling/BERT/data/hdf5_lower_case_1_seq_len_512_max_pred_80_masked_lm_prob_0.15_random_seed_12345_dupe_factor_5
DEST=s3://datasets.dl/BERT_hdf5
AWS_ACCESS_KEY_ID=AKIAZUANCVGQDVHIFLW4 AWS_SECRET_ACCESS_KEY=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 aws --recursive --region=us-east-2 s3 cp $SRC $DEST

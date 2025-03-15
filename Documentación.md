[Ver el documento](Diagrama_Caso1.pdf)

pay_users
user_id INT
email VARCHAR(80)
first_name VARCHAR(50)
last_name VARCHAR(50)
password VARBINARY(250)
enabled BIT(1)
city_id INT
Indexes
pay_media_files
media_file_id INT
URL VARCHAR(200)
deleted BIT(1)
media_type_id TINYINT(1)
user_id INT
Indexes
pay_media_types
media_type_id TINYINT(1)
type VARCHAR(30)
Indexes
pay_roles
role_id TINYINT(1)
role_name VARCHAR(4...
Indexes
pay_permissions
permission_id INT
description VARCHAR(20...
code VARCHAR(10)
module_id INT
Indexes
pay_role_permissions
role_permission_id INT
role_id TINYINT(1)
permission_id INT
enabled BIT(1)
deleted BIT(1)
last_perm_update DATETIME(20)
username VARCHAR(45)
checksum VARBINARY(250)
Indexes
pay_modul...
module_id INT
name VARCHAR(30)
Indexes
pay_user_permissions
user_permission_id INT
permission_id INT
enabled BIT(1)
deleted BIT(1)
last_perm_update DATETIME(20)
username VARCHAR(45)
checksum VARBINARY(250)
user_id INT
Indexes
pay_user_roles
user_id INT
role_id TINYINT(1)
enabled BIT(1)
deleted BIT(1)
last_update DATETIME
username VARCHAR(45)
checksum VARBINARY(250)
Indexes
pay_pays
pay_id INT
pays_types_id INT
amount DECIMAL(9,2)
date_pay DATE
frequency SMALLINT(3)
confirmed BIT(1)
media_file_id INT
currency_id INT
result VARCHAR(40)
auth VARCHAR(60)
reference VARCHAR(100)
change_token VARCHAR(200)
description VARCHAR(100)
error VARCHAR(200)
checksum VARBINARY(250)
method_id INT
Indexes
pay_available_media
available_media_id INT
name VARCHAR(50)
user_id INT
token VARCHAR(255)
expToken DATE
mask_account VARCHAR(50)
method_id INT
Indexes
pay_transactions
transactions_id INT
pay_id INT
date DATETIME
bank_account_id INT
status TINYINT(1)
post_time DATETIME
ref_number VARCHAR(50)
user_id INT
checksum VARBINARY(250)
exchange_rate DECIMAL(5,3)
converted_amount DECIMAL(12,2)
transaction_types_id INT
transaction_subtypes_id INT
Indexes
api_integrations
api_integration_id SMALLINT(...
name VARCHAR(45)
provider_name VARCHAR(45)
public_key VARCHAR(200)
private_key VARCHAR(200)
url VARCHAR(250)
enabled BIT(1)
creation_date DATETIME
last_update DATETIME
Indexes
pay_contact_type
contact_type_id INT
name VARCHAR(45)
Indexes
pay_contact_info
contact_info_id INT
value VARCHAR(100)
enable BIT(1)
last_update DATETIME
contact_type_id INT
user_id INT
Indexes

pay_schedules
schedule_id INT
name VARCHAR(70)
repit BIT(1)
repetitions TINYINT
endDate DATETIME
Indexes
pay_schedules_details
schedules_details_id INT
deleted BIT(1)
pay_schedules_schedule_id INT
datePart DATE
last_execute DATETIME
next_execute DATETIME
Indexes
pay_currency
currency_id INT
name VARCHAR(50)
acronym VARCHAR(5)
symbol VARCHAR(5)
pay_countries_countries_id INT
Indexes
pay_exchange_currency
exchange_currency_id INT
pay_currency_source_id INT
pay_currency_destiny_id INT
start_date DATE
end_date DATE
exchange_rate DECIMAL(5,3)
enabled BIT(1)
current_exchange BIT(1)
Indexes
pay_subscriptions
subscrition_Id INT
description VARCHAR(100)
Indexes
pay_plan_prices
plan_prices_id INT
subscrition_Id INT
amount DECIMAL(10,2)
currency_id INT
postTime DATETIME
endDate DATE
current BIT(1)
Indexes
pay_users_plan_prices
user_id INT
plan_prices_id INT
adquision DATE
enabled BIT(1)
schedule_id INT
Indexes
pay_plan_features
plan_features_id INT
description VARCHAR(50)
enabled BIT(1)
dataType VARCHAR(45)
Indexes
pay_plan_features_subscriptions
pay_plan_features_plan_features_id INT
pay_subscriptions_subscrition_Id INT
value VARCHAR(75)
enabled BIT(1)
Indexes
pay_pay_method
pay_method_id INT
name VARCHAR(50)
api_url VARCHAR(200)
secret_key VARBINARY(255)
key VARCHAR(255)
logo_icon_url VARCHAR(200)
enabled BIT(1)
api_integration_id SMALLINT(1)
Indexes
pay_transaction_types
transaction_types_id INT
name(45) VARCHAR(45)
Indexes
pay_transaction_subtyp...
transaction_subtypes_id INT
name(45) VARCHAR(45)
Indexes
pay_logs
log_id INT
description VARCHAR(200)
postTime DATETIME
computer VARCHAR(75)
username VARCHAR(50)
trace VARCHAR(100)
referenceId1 BIGINT
referenceId2 BIGINT
value1 VARCHAR(180)
value2 VARCHAR(180)
checksum VARBINARY(250)
log_severity_id INT
log_types_id INT
log_sources_id INT
Indexes
pay_log_severi...
log_severity_id INT
name VARCHAR(45)
Indexes
pay_log_sourc...
log_sources_id INT
name VARCHAR(45)
Indexes
pay_log_types
log_types_id INT
name VARCHAR(45)
reference1_description VARCHAR(7...
reference2_description VARCHAR(7...
value1_description VARCHAR(75)
value1_description VARCHAR(75)
value2_description VARCHAR(75)
Indexes
pay_translations
translations_id INT
module_id INT
code VARCHAR(100)
caption VARCHAR(100)
enabled BIT(1)
pay_languages_languages_id I...
Indexes
pay_languag...
languages_id INT
name VARCHAR(45)
culture VARCHAR(100)
Indexes
pay_city
city INT
states_id INT
name VARCHAR(60)
Indexes
pay_states
states_id INT
name VARCHAR(40)
countries_id INT
Indexes
pay_countri...
countries_id INT
name VARCHAR(60)
Indexes
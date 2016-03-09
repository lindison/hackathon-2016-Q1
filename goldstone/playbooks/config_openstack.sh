openstack-config --set	/etc/nova/nova.conf	DEFAULT	syslog_log_facility	LOG_LOCAL0
openstack-config --set	/etc/nova/nova.conf	DEFAULT	use_syslog	TRUE
openstack-config --set	/etc/nova/nova.conf	DEFAULT	verbose	TRUE
openstack-config --set	/etc/nova/nova.conf	DEFAULT	instance_usage_audit	TRUE
openstack-config --set	/etc/nova/nova.conf	DEFAULT	instance_usage_audit_period	hour
openstack-config --set	/etc/nova/nova.conf	DEFAULT	notify_on_state_change	vm_and_task_state
openstack-config --set	/etc/nova/api-paste.ini	composite:openstack_compute_api_v2	keystone	"compute_req_idfaultwrapsizelimitauthtoken keystonecontext ratelimit audit osapi_compute_app_v2"
openstack-config --set	/etc/nova/api-paste.ini	composite:openstack_compute_api_v2	keystone_nolimit	"compute_req_idfaultwrapsizelimitauthtoken keystonecontext audit osapi_compute_app_v2"
openstack-config --set	/etc/nova/api-paste.ini	composite:openstack_compute_api_v21	keystone	"compute_req_idfaultwrapsizelimitauthtoken keystonecontext audit osapi_compute_app_v21"
openstack-config --set	/etc/nova/api-paste.ini	composite:openstack_compute_api_v3	keystone	"request_idfaultwrapsizelimitauthtoken keystonecontext audit osapi_compute_app_v3"
openstack-config --set	/etc/nova/api-paste.ini	filter:audit	paste.filter_factory	keystonemiddleware.audit:filter_factory
openstack-config --set	/etc/nova/api-paste.ini	filter:audit	audit_map_file	/etc/nova/nova_api_audit_map.conf
openstack-config --set	/etc/cinder/cinder.conf	DEFAULT	syslog_log_facility	LOG_LOCAL5
openstack-config --set	/etc/cinder/cinder.conf	DEFAULT	use_syslog	TRUE
openstack-config --set	/etc/cinder/cinder.conf	DEFAULT	verbose	TRUE
openstack-config --set	/etc/cinder/cinder.conf	DEFAULT	control_exchange	cinder
openstack-config --set	/etc/cinder/api-paste.ini	composite:openstack_volume_api_v1	keystone	"request_idfaultwrapsizelimitosprofilerauthtoken keystonecontext audit apiv1"
openstack-config --set	/etc/cinder/api-paste.ini	composite:openstack_volume_api_v1	keystone_nolimit	"request_idfaultwrapsizelimitosprofilerauthtoken keystonecontext audit apiv1"
openstack-config --set	/etc/cinder/api-paste.ini	composite:openstack_volume_api_v2	keystone	"request_idfaultwrapsizelimitosprofilerauthtoken keystonecontext audit apiv2"
openstack-config --set	/etc/cinder/api-paste.ini	composite:openstack_volume_api_v2	keystone_nolimit	"request_idfaultwrapsizelimitosprofilerauthtoken keystonecontext audit apiv2"
openstack-config --set	/etc/cinder/api-paste.ini	filter:audit	paste.filter_factory	keystonemiddleware.audit:filter_factory
openstack-config --set	/etc/cinder/api-paste.ini	filter:audit	audit_map_file	/etc/cinder/cinder_api_audit_map.conf
openstack-config --set	/etc/keystone/keystone.conf	DEFAULT	syslog_log_facility	LOG_LOCAL6
openstack-config --set	/etc/keystone/keystone.conf	DEFAULT	use_syslog	TRUE
openstack-config --set	/etc/keystone/keystone.conf	DEFAULT	verbose	TRUE
openstack-config --set	/etc/keystone/keystone.conf	DEFAULT	notification_format	cadf
openstack-config --set	/etc/neutron/neutron.conf	DEFAULT	syslog_log_facility	LOG_LOCAL2
openstack-config --set	/etc/neutron/neutron.conf	DEFAULT	use_syslog	TRUE
openstack-config --set	/etc/neutron/neutron.conf	DEFAULT	verbose	TRUE
openstack-config --set	/etc/neutron/api-paste.ini	composite:neutronapi_v2_0	use	"call:neutron.auth:pipeline_factory"
openstack-config --set	/etc/neutron/api-paste.ini	composite:neutronapi_v2_0	noauth	"request_idcatch_errorsextensions neutronapiapp_v2_0"
openstack-config --set	/etc/neutron/api-paste.ini	composite:neutronapi_v2_0	keystone	"request_idcatch_errorsauthtokenkeystonecontext audit extensions neutronapiapp_v2_0"
openstack-config --set	/etc/neutron/api-paste.ini	filter:audit	paste.filter_factory	keystonemiddleware.audit:filter_factory
openstack-config --set	/etc/neutron/api-paste.ini	filter:audit	audit_map_file	/etc/neutron/neutron_api_audit_map.conf
openstack-config --set	/etc/ceilometer/ceilometer.conf	DEFAULT	syslog_log_facility	LOG_LOCAL3
openstack-config --set	/etc/ceilometer/ceilometer.conf	DEFAULT	use_syslog	TRUE
openstack-config --set	/etc/ceilometer/ceilometer.conf	DEFAULT	verbose	TRUE
openstack-config --set	/etc/ceilometer/ceilometer.conf	event	definitions_cfg_file	event_definitions.yaml
openstack-config --set	/etc/ceilometer/ceilometer.conf	event	drop_unmatched_notifications	FALSE
openstack-config --set	/etc/ceilometer/ceilometer.conf	notification	store_events	TRUE
openstack-config --set	/etc/ceilometer/ceilometer.conf	notification	disable_non_metric_meters	TRUE
openstack-config --set	/etc/ceilometer/ceilometer.conf	database	event_connection	es://%s:9200%goldstone_addr
openstack-config --set	/etc/ceilometer/ceilometer.conf	database	time_to_live	604800#oneweek
openstack-config --set	/etc/ceilometer/api_paste.ini	pipeline:main	pipeline	request_idauthtokenauditapi-server
openstack-config --set	/etc/ceilometer/api_paste.ini	filter:audit	paste.filter_factory	keystonemiddleware.audit:filter_factory
openstack-config --set	/etc/ceilometer/api_paste.ini	filter:audit	audit_map_file	/etc/ceilometer/ceilometer_api_audit_map.conf
openstack-config --set	/etc/glance/glance-cache.conf	DEFAULT	syslog_log_facility	LOG_LOCAL1
openstack-config --set	/etc/glance/glance-cache.conf	DEFAULT	use_syslog	TRUE
openstack-config --set	/etc/glance/glance-cache.conf	DEFAULT	verbose	TRUE
openstack-config --set	/etc/glance/glance-api.conf	DEFAULT	syslog_log_facility	LOG_LOCAL1
openstack-config --set	/etc/glance/glance-api.conf	DEFAULT	use_syslog	TRUE
openstack-config --set	/etc/glance/glance-api.conf	DEFAULT	verbose	TRUE
openstack-config --set	/etc/glance/glance-api.conf	paste_deploy	config_file	/etc/glance/glance-api-paste.ini
openstack-config --set	/etc/glance/glance-registry.conf	DEFAULT	syslog_log_facility	LOG_LOCAL1
openstack-config --set	/etc/glance/glance-registry.conf	DEFAULT	use_syslog	TRUE
openstack-config --set	/etc/glance/glance-registry.conf	DEFAULT	verbose	TRUE
openstack-config --set	/etc/glance/glance-scrubber.conf	DEFAULT	syslog_log_facility	LOG_LOCAL1
openstack-config --set	/etc/glance/glance-scrubber.conf	DEFAULT	use_syslog	TRUE
openstack-config --set	/etc/glance/glance-scrubber.conf	DEFAULT	verbose	TRUE

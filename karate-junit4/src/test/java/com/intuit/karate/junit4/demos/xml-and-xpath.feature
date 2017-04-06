Feature:

Scenario:

* def foo =
"""
<records>
  <record index="1">a</record>
  <record index="2">b</record>
  <record index="3" foo="bar">c</record>
</records>
"""
* assert foo.records.record.length == 3

* def count = get foo count(/records//record)
* assert count == 3

* def second = get foo //record[@index=2]
* assert second == 'b'

* match foo //record[@foo='bar'] == 'c'

* match foo == <records><record index="1">a</record><record index="#? _ &gt; 1">b</record><record index="3" foo="bar">#string</record></records>

* def xml = <?xml version="1.0" encoding="UTF-8"?> <response> <result>succeed</result> <records> <record> <browser_port>8008</browser_port> <current_date_time>2017-04-03 20:29:58 CDT</current_date_time> <date_time_server_started>2017-03-21 12:23:55 CDT</date_time_server_started> <os_version>Red Hat Enterprise Linux 6 2.6.32-573.12.1.el6.x86_64, 64 Bit, x86_64</os_version> <product_version>R04M001170316</product_version> <product_database_version>20170131131718</product_database_version> <replication_heartbeat_timestamp>2017-04-03 20:25:00 CDT</replication_heartbeat_timestamp> </record> </records> </response>
* def count = get xml count(/response/records//record)
* assert count == 1
* match xml/response/result == 'succeed'
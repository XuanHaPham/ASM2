<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="ASM_TableStorage" generation="1" functional="0" release="0" Id="00b00cdf-d3ea-4f79-8996-a6fc4dab8b0b" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="ASM_TableStorageGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="BooksStore:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/ASM_TableStorage/ASM_TableStorageGroup/LB:BooksStore:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="BooksStore:DataConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/ASM_TableStorage/ASM_TableStorageGroup/MapBooksStore:DataConnectionString" />
          </maps>
        </aCS>
        <aCS name="BooksStore:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/ASM_TableStorage/ASM_TableStorageGroup/MapBooksStore:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="BooksStoreInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/ASM_TableStorage/ASM_TableStorageGroup/MapBooksStoreInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:BooksStore:Endpoint1">
          <toPorts>
            <inPortMoniker name="/ASM_TableStorage/ASM_TableStorageGroup/BooksStore/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapBooksStore:DataConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/ASM_TableStorage/ASM_TableStorageGroup/BooksStore/DataConnectionString" />
          </setting>
        </map>
        <map name="MapBooksStore:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/ASM_TableStorage/ASM_TableStorageGroup/BooksStore/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapBooksStoreInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/ASM_TableStorage/ASM_TableStorageGroup/BooksStoreInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="BooksStore" generation="1" functional="0" release="0" software="C:\Users\Ha\Desktop\ASM_TableStorage\ASM_TableStorage\csx\Debug\roles\BooksStore" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="DataConnectionString" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;BooksStore&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;BooksStore&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/ASM_TableStorage/ASM_TableStorageGroup/BooksStoreInstances" />
            <sCSPolicyUpdateDomainMoniker name="/ASM_TableStorage/ASM_TableStorageGroup/BooksStoreUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/ASM_TableStorage/ASM_TableStorageGroup/BooksStoreFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="BooksStoreUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="BooksStoreFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="BooksStoreInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="e7ef543f-49ad-4a09-8fcd-d3f8ca8d0d7c" ref="Microsoft.RedDog.Contract\ServiceContract\ASM_TableStorageContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="f8379833-a6ac-460d-b877-f90e0264527b" ref="Microsoft.RedDog.Contract\Interface\BooksStore:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/ASM_TableStorage/ASM_TableStorageGroup/BooksStore:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>
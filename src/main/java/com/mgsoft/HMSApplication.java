package com.mgsoft;

import java.io.File;
import java.io.FileReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.util.ResourceUtils;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mgsoft.module.admin.beans.Menu;
import com.mgsoft.module.admin.beans.Module;
import com.mgsoft.module.admin.beans.RoleMaster;
import com.mgsoft.module.admin.beans.RoleRights;
import com.mgsoft.module.admin.beans.UserMaster;
import com.mgsoft.module.admin.repository.MenuRepository;
import com.mgsoft.module.admin.repository.ModuleRepository;
import com.mgsoft.module.admin.repository.RoleMasterRepository;
import com.mgsoft.module.admin.repository.UserRepository;
import com.mgsoft.module.appointment.beans.AppointmentStatus;
import com.mgsoft.module.appointment.repositories.AppointmentStatusRepository;
import com.mgsoft.module.contactBook.beans.ContactBook;
import com.mgsoft.module.contactBook.repositories.ContactBookRepository;
import com.mgsoft.module.customer.beans.PartyMaster;
import com.mgsoft.module.customer.repositories.PartyMasterRepository;
import com.mgsoft.module.doctor.beans.DoctorMaster;
import com.mgsoft.module.doctor.repositories.DoctorMasterRepository;
import com.mgsoft.module.inventory.beans.InvItem;
import com.mgsoft.module.inventory.beans.ItemCategory;
import com.mgsoft.module.inventory.repositories.InvItemRepository;
import com.mgsoft.module.inventory.repositories.ItemCategoryRepository;
import com.mgsoft.module.setting.beans.StateMaster;
import com.mgsoft.module.setting.beans.Tax;
import com.mgsoft.module.setting.repositories.StateMasterRepository;
import com.mgsoft.module.setting.repositories.TaxRepository;

@SpringBootApplication
//@EnableWebMvc
@EnableConfigurationProperties
@EntityScan(basePackages = { "com.mgsoft" })
public class HMSApplication extends SpringBootServletInitializer {

	@Autowired
	private ModuleRepository moduleRepository;
	
	@Autowired
	private ItemCategoryRepository categoryRepository;
	
	@Autowired
	private PartyMasterRepository partyMasterRepository;
	
	@Autowired
	private MenuRepository menuRepository;
	
	@Autowired
	private TaxRepository taxRepository;
	
	@Autowired
	private InvItemRepository invItemRepository;
	
	@Autowired
	private StateMasterRepository stateMasterRepository;
	
	@Autowired
	private ContactBookRepository contactBookRepository;
	
	@Autowired
	DoctorMasterRepository doctorMasterRepository;
	
	@Autowired
	RoleMasterRepository roleMasterRepository;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	ServletContext context;

	@Autowired
	AppointmentStatusRepository appointmentStatusRepository;
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(HMSApplication.class);
	}

	public static void main(String[] args) throws Exception {
		SpringApplication.run(HMSApplication.class, args);
	}


	@Bean
	InitializingBean sendDatabase() {
		return () -> {
//			File f1 = new File(context.getRealPath("h2db/hmsDb.mv.db"));
//			if(f1.exists()) {
//			    Path filePath = Paths.get(context.getRealPath("h2db/hmsDb.mv.db"));
//			    Files.delete(filePath);
//			    //f1.delete();
//			}
			
			String moduleJson = "[{\"module_name\":\"Dashboard\",\"isLink\":false,\"srNo\":1,\"module_icon\":\"package\",\"classes\":\"startModule dashboardModule\",\"menu\":[{\"menu_name\":\"Sales Dashboard\",\"isLink\":true,\"classes\":\"startLink\",\"url\":\"app/dashboard/s\"}]},{\"module_name\":\"Contact Book\",\"isLink\":false,\"srNo\":2,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Contact List\",\"isLink\":true,\"url\":\"app/contactBook\"}]},{\"module_name\":\"Admin\",\"isLink\":false,\"srNo\":3,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Entity Master\",\"isLink\":true,\"status\":\"E\",\"url\":\"app/admin/entityMaster\"},{\"menu_name\":\"Module Master\",\"isLink\":true,\"url\":\"app/admin/moduleMaster\"},{\"menu_name\":\"Menu Master\",\"isLink\":true,\"url\":\"app/admin/menuMaster\"},{\"menu_name\":\"Role Master\",\"isLink\":true,\"url\":\"app/admin/roleMaster\"},{\"menu_name\":\"User Master\",\"isLink\":true,\"url\":\"app/admin/userMaster\"},{\"menu_name\":\"Branch Master\",\"isLink\":true,\"url\":\"app/admin/branchMaster\"}]},{\"module_name\":\"Accounting\",\"isLink\":false,\"srNo\":17,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Account Master\",\"isLink\":true,\"url\":\"app/accounting/accountMaster\"},{\"menu_name\":\"Journal Master\",\"isLink\":true,\"url\":\"app/accounting/journalMaster\"},{\"menu_name\":\"Ledger Master\",\"isLink\":true,\"url\":\"app/accounting/ledgerMaster\"}]},{\"module_name\":\"Inventory\",\"isLink\":false,\"srNo\":22,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Category Master\",\"isLink\":true,\"url\":\"app/inventory/categoryMaster\"},{\"menu_name\":\"Location Master\",\"isLink\":true,\"url\":\"app/inventory/locationMaster\"},{\"menu_name\":\"Attribute Master\",\"isLink\":true,\"url\":\"app/inventory/attributeMaster\"},{\"menu_name\":\"Item / Service Master\",\"isLink\":true,\"url\":\"app/inventory/itemServiceMaster\"},{\"menu_name\":\"Stock Adjustment\",\"isLink\":true,\"url\":\"app/inventory/stockAdjustment\"}]},{\"module_name\":\"Settings\",\"isLink\":false,\"srNo\":4,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Hospital Master\",\"isLink\":true,\"url\":\"app/setting/hospitalMaster\"},{\"menu_name\":\"Department Master\",\"isLink\":true,\"url\":\"app/setting/departmentMaster\"},{\"menu_name\":\"Symptoms Master\",\"isLink\":true,\"url\":\"app/setting/symptomsMaster\"},{\"menu_name\":\"Diseases Master\",\"isLink\":true,\"url\":\"app/setting/diseasesMaster\"},{\"menu_name\":\"Ambulance Master\",\"isLink\":true,\"url\":\"app/setting/ambulanceMaster\"},{\"menu_name\":\"Tax Master\",\"isLink\":true,\"url\":\"app/setting/taxMaster\"},{\"menu_name\":\"Discount Master\",\"isLink\":true,\"url\":\"app/setting/discountMaster\"},{\"menu_name\":\"Other Settings\",\"isLink\":true,\"url\":\"app/setting/otherSettings\"}]},{\"module_name\":\"Party\",\"isLink\":false,\"srNo\":23,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Party Master\",\"isLink\":true,\"url\":\"app/party/partyMaster\"}]},{\"module_name\":\"Aappointment\",\"isLink\":false,\"srNo\":5,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Appointment Master\",\"isLink\":true,\"url\":\"app/appointment/appointmentMaster\"}]},{\"module_name\":\"Patient\",\"isLink\":false,\"srNo\":6,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Patient Master\",\"isLink\":true,\"url\":\"app/patient/patientMaster\"}]},{\"module_name\":\"Doctor\",\"isLink\":false,\"srNo\":7,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Doctor Master\",\"isLink\":true,\"url\":\"app/doctor/doctorMaster\"}]},{\"module_name\":\"Billing\",\"isLink\":false,\"srNo\":18,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Billing Master\",\"isLink\":true,\"url\":\"app/billing/billingMaster\"}]},{\"module_name\":\"Blood Bank\",\"isLink\":false,\"srNo\":8,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Blood Group Master\",\"isLink\":true,\"url\":\"appdBank/bloodGroupMaster\"},{\"menu_name\":\"Blood Bank Status\",\"isLink\":true,\"url\":\"app/bloodBank/bloodBankStatus\"},{\"menu_name\":\"Blood Issue Detail\",\"isLink\":true,\"url\":\"app/bloodBank/bloodIssueDetail\"},{\"menu_name\":\"Blood Donor Detail\",\"isLink\":true,\"url\":\"app/bloodBank/bloodDonorDetail\"}]},{\"module_name\":\"Lab\",\"isLink\":false,\"srNo\":9,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Lab Master\",\"isLink\":true,\"url\":\"app/lab/labMaster\"}]},{\"module_name\":\"Ward / Room\",\"isLink\":false,\"srNo\":10,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Room Master\",\"isLink\":true,\"url\":\"app/room/roomMaster\"}]},{\"module_name\":\"Payroll\",\"isLink\":false,\"srNo\":19,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Payroll Master\",\"isLink\":true,\"url\":\"app/payroll/payrollMaster\"}]},{\"module_name\":\"Employee\",\"isLink\":false,\"srNo\":20,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Employee Master\",\"isLink\":true,\"url\":\"app/employee/employeeMaster\"}]},{\"module_name\":\"Donation\",\"isLink\":false,\"srNo\":11,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Organ Donation Master\",\"isLink\":true,\"url\":\"app/donation/organDonationMaster\"}]},{\"module_name\":\"Login\",\"isLink\":false,\"srNo\":24,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Login\",\"isLink\":true,\"url\":\"app/login\"}]},{\"module_name\":\"Medical Store\",\"isLink\":false,\"srNo\":12,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Store Master\",\"isLink\":true,\"url\":\"app/medicalStore/storeMaster\"}]},{\"module_name\":\"Procurement\",\"isLink\":false,\"srNo\":13,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Procurement Master\",\"isLink\":true,\"url\":\"app/procurement/procurementMaster\"}]},{\"module_name\":\"Asset Management\",\"isLink\":false,\"srNo\":21,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Asset Master\",\"isLink\":true,\"url\":\"app/assetManagement/assetMaster\"}]},{\"module_name\":\"Pharmacy\",\"isLink\":false,\"srNo\":14,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Pharmacy Master\",\"isLink\":true,\"url\":\"app/pharmacy/pharmacyMaster\"}]},{\"module_name\":\"Diagnostic\",\"isLink\":false,\"srNo\":15,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Test Group\",\"isLink\":true,\"url\":\"app/diagnostic/testGroup\"},{\"menu_name\":\"Test Master\",\"isLink\":true,\"url\":\"app/diagnostic/testMaster\"}]},{\"module_name\":\"Operation Theatre\",\"isLink\":false,\"srNo\":16,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Operation Master\",\"isLink\":true,\"url\":\"app/ot/operationMaster\"},{\"menu_name\":\"OT Detail\",\"isLink\":true,\"url\":\"app/ot/otDetail\"}]},{\"module_name\":\"Reports\",\"isLink\":false,\"srNo\":25,\"module_icon\":\"package\",\"menu\":[{\"menu_name\":\"Reports List\",\"isLink\":true,\"url\":\"app/contactBook\"}]}]";
			String stateList = "[{\"state_name\":\"Jammu and Kashmir\",\"alpha_code\":\"JK\",\"state_code\":1},{\"state_name\":\"Himachal Pradesh\",\"alpha_code\":\"HP\",\"state_code\":2},{\"state_name\":\"Punjab\",\"alpha_code\":\"PB\",\"state_code\":3},{\"state_name\":\"Chandigarh\",\"alpha_code\":\"CH\",\"state_code\":4},{\"state_name\":\"Uttarakhand\",\"alpha_code\":\"UA\",\"state_code\":5},{\"state_name\":\"Haryana\",\"alpha_code\":\"HR\",\"state_code\":6},{\"state_name\":\"Delhi\",\"alpha_code\":\"DL\",\"state_code\":7},{\"state_name\":\"Rajasthan\",\"alpha_code\":\"RJ\",\"state_code\":8},{\"state_name\":\"Uttar Pradesh\",\"alpha_code\":\"UP\",\"state_code\":9},{\"state_name\":\"Bihar\",\"alpha_code\":\"BR\",\"state_code\":10},{\"state_name\":\"Sikkim\",\"alpha_code\":\"SK\",\"state_code\":11},{\"state_name\":\"Arunachal Pradesh\",\"alpha_code\":\"AR\",\"state_code\":12},{\"state_name\":\"Nagaland\",\"alpha_code\":\"NL\",\"state_code\":13},{\"state_name\":\"Manipur\",\"alpha_code\":\"MN\",\"state_code\":14},{\"state_name\":\"Mizoram\",\"alpha_code\":\"MZ\",\"state_code\":15},{\"state_name\":\"Tripura\",\"alpha_code\":\"TR\",\"state_code\":16},{\"state_name\":\"Meghalaya\",\"alpha_code\":\"ML\",\"state_code\":17},{\"state_name\":\"Assam\",\"alpha_code\":\"AS\",\"state_code\":18},{\"state_name\":\"West Bengal\",\"alpha_code\":\"WB\",\"state_code\":19},{\"state_name\":\"Jharkhand\",\"alpha_code\":\"JH\",\"state_code\":20},{\"state_name\":\"Orissa\",\"alpha_code\":\"OR\",\"state_code\":21},{\"state_name\":\"Chhattisgarh\",\"alpha_code\":\"CG\",\"state_code\":22},{\"state_name\":\"Madhya Pradesh\",\"alpha_code\":\"MP\",\"state_code\":23},{\"state_name\":\"Gujarat\",\"alpha_code\":\"GJ\",\"state_code\":24},{\"state_name\":\"Daman and Diu\",\"alpha_code\":\"DD\",\"state_code\":25},{\"state_name\":\"Dadra and Nagar Haveli\",\"alpha_code\":\"DN\",\"state_code\":26},{\"state_name\":\"Maharashtra\",\"alpha_code\":\"MH\",\"state_code\":27},{\"state_name\":\"Karnataka\",\"alpha_code\":\"KA\",\"state_code\":29},{\"state_name\":\"Goa\",\"alpha_code\":\"GA\",\"state_code\":30},{\"state_name\":\"Lakshadweep\",\"alpha_code\":\"LD\",\"state_code\":31},{\"state_name\":\"Kerala\",\"alpha_code\":\"KL\",\"state_code\":32},{\"state_name\":\"Tamil Nadu\",\"alpha_code\":\"TN\",\"state_code\":33},{\"state_name\":\"Puducherry\",\"alpha_code\":\"PY\",\"state_code\":34},{\"state_name\":\"Andaman and Nicobar Islands\",\"alpha_code\":\"AN\",\"state_code\":35},{\"state_name\":\"Telangana\",\"alpha_code\":\"TS\",\"state_code\":36},{\"state_name\":\"Andhra Pradesh\",\"alpha_code\":\"AP\",\"state_code\":37},{\"state_name\":\"Other Territory\",\"alpha_code\":\"OT\",\"state_code\":97}]";
			JsonParser p = new JsonParser();
			JsonArray moArrays = p.parse(moduleJson).getAsJsonArray();
			//JsonArray moArrays = p.parse(new FileReader(ResourceUtils.getFile("classpath:WEB-INF/modules.json"))).getAsJsonArray();
			for (int i = 0; i < moArrays.size(); i++) {
				JsonObject module = moArrays.get(i).getAsJsonObject();
				Module m = new Module();
				m.setModuleName( module.has("module_name") ? module.get("module_name").getAsString() : null);
				m.setModuleIcon( module.has("module_icon") ? module.get("module_icon").getAsString() : null);
				m.setModuleCssClasses(module.has("classes") ? module.get("classes").getAsString() : null);
				m.setSrNo(module.has("srNo") ? module.get("srNo").getAsInt() : null);
				if(module.has("isLink") && module.get("isLink").getAsBoolean()) {
					m.setHasLink(true);
				}else {
					m.setHasLink(false);
				}
				if(module.has("url")) {
					m.setLink(module.get("url").getAsString());
				}
				List<Menu> menus = new ArrayList<>();
				if(module.has("menu")) {
					JsonArray menuArrays = module.get("menu").getAsJsonArray();
					for (int k = 0; k < menuArrays.size(); k++) {
						JsonObject menu = menuArrays.get(k).getAsJsonObject();
						Menu men = new Menu();
						men.setMenuName(menu.has("menu_name") ? menu.get("menu_name").getAsString() : null);
						men.setHasLink(menu.has("isLink") ? menu.get("isLink").getAsBoolean() : null);
						men.setLink(menu.has("url") ? menu.get("url").getAsString() : null);
						men.setStatus(menu.has("status") ? menu.get("status").getAsString() : null);
						men.setMenuCssClasses(menu.has("classes") ? menu.get("classes").getAsString() : null);
						men.setModule(m);
						menus.add(men);
					}
				}
				m.setMenus(menus);
				moduleRepository.save(m);
			}
			
			RoleMaster rm3 = new RoleMaster();
			rm3.setRoleName("Nurse");
			rm3.setRoleStatus("Active");
			
			RoleMaster rm2 = new RoleMaster();
			rm2.setRoleName("Doctor");
			rm2.setRoleStatus("Active");
			
			roleMasterRepository.save(rm3);
			roleMasterRepository.save(rm2);
			
			
			RoleMaster rm1 = new RoleMaster();
			rm1.setRoleName("Admin");
			rm1.setRoleStatus("Active");
			
			Set<RoleRights> roleRightList = new HashSet<>();
			List<Module> moduleList = moduleRepository.findAll();
			for (Module module : moduleList) {
				for (Menu menu : module.getMenus()) {
					RoleRights rr1 = new RoleRights();
					rr1.setModuleId(module.getId());
					rr1.setModuleName(module.getModuleName());
					rr1.setModuleView(true);
					rr1.setModuleAdd(true);
					rr1.setModuleEdit(true);
					rr1.setModuleDelete(true);
					rr1.setMenuId(menu.getId());
					rr1.setMenuName(menu.getMenuName());
					rr1.setMenuView(true);
					rr1.setMenuAdd(true);
					rr1.setMenuEdit(true);
					rr1.setMenuDelete(true);
					rr1.setRoleMaster(rm1);
					roleRightList.add(rr1);
				}
			}
			
			rm1.setRoleMasterRights(roleRightList);  
			
			UserMaster um = new UserMaster();
			um.setUserLoginName("admin");
			um.setUserLoginPassword("admin");
			um.setUserStatus("Active");
			um.setUserName("Administration");
			um.setUserContact("8055880605");
			Set<RoleMaster> rmList = new HashSet<>();
			
			rmList.add(rm1);
			um.setRoles(rmList);
			UserMaster umRes = userRepository.save(um);
			
			rm1.getUsers().add(um);
			roleMasterRepository.save(rm1);
			
			DoctorMaster dm = new DoctorMaster();
			dm.setDoctStartLatter("N");
			dm.setDoctFName("Nikhil");
			dm.setDoctMName("Ramkrushna");
			dm.setDoctLName("Wandhare");
			dm.setDoctMob("7856898980");
			dm.setDoctHomeLLNo("0719 2453098");
			dm.setDoctHomeMob("9288909899");
			dm.setDoctWorkLLNo("0754 4567453");
			dm.setDoctEmailOfficial("nikhil.wandhare@vgipl.in");
			dm.setDoctCompany("Virtual Galaxy Infotech");
			dm.setDoctJobPost("Team Lead");
			dm.setDoctHomeAddr1("PN. 465 Ayodhya Nagar\r\n" + "Nagpur, Maharashtra, India");
			dm.setDoctPersonalWeb("www.nw.in");
			dm.setDoctDob(new Date());
			dm.setDoctGender("M");
			doctorMasterRepository.save(dm);
			
			ContactBook cb1 = new ContactBook();
			cb1.setContStartLatter("N");
			cb1.setContFName("Nikhil");
			cb1.setContMName("Ramkrushna");
			cb1.setContLName("Wandhare");
			cb1.setContMob("7856898980");
			cb1.setContHomeLLNo("0719 2453098");
			cb1.setContHomeMob("9288909899");
			cb1.setContWorkLLNo("0754 4567453");
			cb1.setContEmail("nikhil.wandhare@vgipl.in");
			cb1.setContCompany("Virtual Galaxy Infotech");
			cb1.setContJobPost("Team Lead");
			cb1.setContHomeAddr("PN. 465 Ayodhya Nagar\r\n" + "Nagpur, Maharashtra, India");
			cb1.setContWorkAddr("PN. 68 Dattatry Nagar\r\n" + "Nagpur, Maharashtra, India");
			cb1.setContPersonalWeb("www.nw.in");
			cb1.setContDob(new Date());
			contactBookRepository.save(cb1);
			
			ContactBook cb = new ContactBook();
			cb.setContStartLatter("M");
			cb.setContFName("Mayur");
			cb.setContMName("Gunvant");
			cb.setContLName("Gajapure");
			cb.setContMob("8055880605");
			cb.setContHomeLLNo("0719 2323098");
			cb.setContHomeMob("7890890989");
			cb.setContWorkLLNo("0712 2525457");
			cb.setContEmail("mayur.gajapure@vgipl.in");
			cb.setContCompany("Virtual Galaxy Infotech");
			cb.setContJobPost("Sr. Java Developer");
			cb.setContHomeAddr("4658 Kenwood Place\r\n" + "Pompano Beach, FL 33060, United States");
			cb.setContWorkAddr("819 Waldeck Street\r\n" + "Farmers Branch, TX 75244, United States");
			cb.setContPersonalWeb("www.mgg.in");
			cb.setContDob(new Date());
			cb.setContFavoriteFlag("Y");
			contactBookRepository.save(cb);
			
			

			Tax tax = new Tax();
			tax.setAuthName("MGG");
			tax.setStatus("Active");
			tax.setTaxCode("GST-5%");
			tax.setTaxName("GST-5%");
			tax.setTaxRate("5");
			tax.setTaxRegNo("TAX67755ERT");
			
			taxRepository.save(tax);
			
			PartyMaster customer = new PartyMaster();
			customer.setCity("Sakoli");
			customer.setAddrL1("Civil Line,");
			customer.setAddrL2("Behind Vetarnary hospital,");
			customer.setPincode("441802");
			customer.setState("MH");
			customer.setMobile("8055880605");
			customer.setName("Mayur G Gajapure");
			customer.setEmail("mgg@gmail.com");
			customer = partyMasterRepository.save(customer);
			
			String[] statusName = {"In","Out","Present","Absent","Canceld","Bill Paid","Bill Unpaid"};
			for(int i=0;i<statusName.length;i++)
			{
			AppointmentStatus appointmentStatus = new AppointmentStatus();
			appointmentStatus.setName(statusName[i]);
			appointmentStatus.setStatus("E");
			appointmentStatusRepository.save(appointmentStatus);
			}
			
//			ItemCategory category1 = new ItemCategory();
//			ItemCategory category2 = new ItemCategory();
//			
//			InvItem mobile = new InvItem();
//			mobile.setBrand("Samsung");
//			mobile.setCostPrice("13500");
//			mobile.setExpiryDate(null);
//			mobile.setHsnDesc("Mobile and accessories");
//			mobile.setHsnNo("4324");
//			mobile.setItemCategory(category1);
//			mobile.setItemName("Samsung Note 10 Plus");
//			mobile.setLowStockQty("2");
//			mobile.setMainQty("10");
//			mobile.setMeasurementUnit("Nos");
//			mobile.setSellingPrice("15000");
//			mobile.setStatus("Active");
//			
//			
//			InvItem shirt = new InvItem();
//			shirt.setBrand("Indigo Nation");
//			shirt.setCostPrice("1500");
//			shirt.setExpiryDate(null);
//			shirt.setHsnDesc("Clothing");
//			shirt.setHsnNo("8799");
//			shirt.setItemCategory(category2);
//			shirt.setItemName("Mens Shirt L (40) Indigo Nation");
//			shirt.setLowStockQty("2");
//			shirt.setMainQty("20");
//			shirt.setMeasurementUnit("Nos");
//			shirt.setSellingPrice("2000");
//			shirt.setStatus("Active");
//			
//			
//			List<InvItem> invItems1 = new ArrayList<>();
//			invItems1.add(mobile);
//			category1.setCategoryName("Electronics");
//			category1.setDesc("Electronics and appliances");
//			category1.setParentCategoryId(null);
//			category1.setInvItems(invItems1);
//			category1.setStatus("Active");
//			
//			List<InvItem> invItems2 = new ArrayList<>();
//			invItems2.add(shirt);
//			category2.setCategoryName("Clothing");
//			category2.setDesc("Mens Womens Clothings");
//			category2.setParentCategoryId(null);
//			category2.setInvItems(invItems2);
//			category2.setStatus("Active");
//			
//			categoryRepository.save(category1);
//			categoryRepository.save(category2);
//			
//			InvItem bottal = new InvItem();
//			bottal.setBrand("H2");
//			bottal.setCostPrice("30");
//			bottal.setExpiryDate(null);
//			bottal.setHsnDesc("Water Bottal");
//			bottal.setHsnNo("4894");
//			bottal.setItemCategory(null);
//			bottal.setItemName("H2O 1 Litter Water Bottal");
//			bottal.setLowStockQty("2");
//			bottal.setMainQty("100");
//			bottal.setMeasurementUnit("Nos");
//			bottal.setSellingPrice("45");
//			bottal.setStatus("Active");
//			
//			invItemRepository.save(bottal);
			
			JsonArray stateArrays = p.parse(stateList).getAsJsonArray();
			//JsonArray stateArrays = p.parse(new FileReader(ResourceUtils.getFile("classpath:WEB-INF/state_list.json"))).getAsJsonArray();
			for (int i = 0; i < stateArrays.size(); i++) {
				JsonObject state = stateArrays.get(i).getAsJsonObject();
				StateMaster sm = new StateMaster();
				sm.setStateName( state.has("state_name") ? state.get("state_name").getAsString() : null);
				sm.setAlphaCode( state.has("alpha_code") ? state.get("alpha_code").getAsString() : null);
				sm.setStateCode( state.has("state_code") ? state.get("state_code").getAsInt() : null);
				stateMasterRepository.save(sm);
			}
		};
	}

}

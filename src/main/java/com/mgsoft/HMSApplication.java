package com.mgsoft;

import java.io.File;
import java.io.FileReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

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

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mgsoft.module.admin.beans.Menu;
import com.mgsoft.module.admin.beans.Module;
import com.mgsoft.module.admin.repository.MenuRepository;
import com.mgsoft.module.admin.repository.ModuleRepository;
import com.mgsoft.module.customer.beans.PartyMaster;
import com.mgsoft.module.customer.repositories.PartyMasterRepository;
import com.mgsoft.module.inventory.beans.InvItem;
import com.mgsoft.module.inventory.beans.ItemCategory;
import com.mgsoft.module.inventory.repositories.InvItemRepository;
import com.mgsoft.module.inventory.repositories.ItemCategoryRepository;
import com.mgsoft.module.setting.beans.StateMaster;
import com.mgsoft.module.setting.beans.Tax;
import com.mgsoft.module.setting.repositories.StateMasterRepository;
import com.mgsoft.module.setting.repositories.TaxRepository;

@SpringBootApplication
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
	ServletContext context;

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
			File f1 = new File(context.getRealPath("h2db/invoicingDb.mv.db"));
			if(f1.exists()) {
			    Path filePath = Paths.get(context.getRealPath("h2db/invoicingDb.mv.db"));
			    Files.delete(filePath);
			    //f1.delete();
			}

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
			
			ItemCategory category1 = new ItemCategory();
			ItemCategory category2 = new ItemCategory();
			
			InvItem mobile = new InvItem();
			mobile.setBrand("Samsung");
			mobile.setCostPrice("13500");
			mobile.setExpiryDate(null);
			mobile.setHsnDesc("Mobile and accessories");
			mobile.setHsnNo("4324");
			mobile.setItemCategory(category1);
			mobile.setItemName("Samsung Note 10 Plus");
			mobile.setLowStockQty("2");
			mobile.setMainQty("10");
			mobile.setMeasurementUnit("Nos");
			mobile.setSellingPrice("15000");
			mobile.setStatus("Active");
			
			
			InvItem shirt = new InvItem();
			shirt.setBrand("Indigo Nation");
			shirt.setCostPrice("1500");
			shirt.setExpiryDate(null);
			shirt.setHsnDesc("Clothing");
			shirt.setHsnNo("8799");
			shirt.setItemCategory(category2);
			shirt.setItemName("Mens Shirt L (40) Indigo Nation");
			shirt.setLowStockQty("2");
			shirt.setMainQty("20");
			shirt.setMeasurementUnit("Nos");
			shirt.setSellingPrice("2000");
			shirt.setStatus("Active");
			
			
			List<InvItem> invItems1 = new ArrayList<>();
			invItems1.add(mobile);
			category1.setCategoryName("Electronics");
			category1.setDesc("Electronics and appliances");
			category1.setParentCategoryId(null);
			category1.setInvItems(invItems1);
			category1.setStatus("Active");
			
			List<InvItem> invItems2 = new ArrayList<>();
			invItems2.add(shirt);
			category2.setCategoryName("Clothing");
			category2.setDesc("Mens Womens Clothings");
			category2.setParentCategoryId(null);
			category2.setInvItems(invItems2);
			category2.setStatus("Active");
			
			categoryRepository.save(category1);
			categoryRepository.save(category2);
			
			InvItem bottal = new InvItem();
			bottal.setBrand("H2");
			bottal.setCostPrice("30");
			bottal.setExpiryDate(null);
			bottal.setHsnDesc("Water Bottal");
			bottal.setHsnNo("4894");
			bottal.setItemCategory(null);
			bottal.setItemName("H2O 1 Litter Water Bottal");
			bottal.setLowStockQty("2");
			bottal.setMainQty("100");
			bottal.setMeasurementUnit("Nos");
			bottal.setSellingPrice("45");
			bottal.setStatus("Active");
			
			invItemRepository.save(bottal);
			
			
//			JSONParser parser = new JSONParser();
//			JSONArray a1 = (JSONArray) parser.parse(new FileReader(ResourceUtils.getFile("classpath:static/json_files/module.json")));//"C:\\Users\\EPS01\\Desktop\\JSON_DATA\\MODULE.json"));
//			JSONArray a2 = (JSONArray) parser.parse(new FileReader(ResourceUtils.getFile("classpath:static/json_files/menu.json")));//"C:\\Users\\EPS01\\Desktop\\JSON_DATA\\menu.json"));
//			for (int i = 0; i < a1.size(); i++) {
//				JSONObject obj = (JSONObject) a1.get(i);
//				System.out.println("obj module:"+obj.toString());
//				Module m = new Module();
//				m.setId((Long) obj.get("module_id"));
//				m.setModuleName((String) obj.get("module_name"));
//				m.setModuleIcon((String) obj.get("module_icon"));
//				m.setModuleUnder((String) obj.get("module_under"));
//				if((Long) obj.get("hasLink") == 1) {
//					m.setHasLink(true);
//				}else {
//					m.setHasLink(false);
//				}
//				m.setLink((String) obj.get("link"));
//				moduleRepository.save(m);
//			}
//			
//			for (int i = 0; i < a2.size(); i++) {
//				JSONObject obj = (JSONObject) a2.get(i);
//				Menu m = new Menu();
//				m.setId((Long) obj.get("id"));
//				m.setMenuName((String) obj.get("menuName"));
//				m.setParentMenuId((Long) obj.get("parentMenuId"));
//				m.setModuleId((Long) obj.get("moduleId"));
//				if((Long) obj.get("haslink") == 1) {
//					m.setHasLink(true);
//				}else {
//					m.setHasLink(false);
//				}
//				m.setLink((String) obj.get("link"));
//				Menu mr = menuRepository.save(m);
//				System.out.println("obj menu:"+mr);
//			}
			
			JsonParser p = new JsonParser();
			JsonArray moArrays = p.parse(new FileReader(ResourceUtils.getFile("classpath:static/json_files/modules.json"))).getAsJsonArray();
			//JSONArray a2 = (JSONArray) parser.parse(new FileReader(ResourceUtils.getFile("classpath:static/json_files/menu.json")));//"C:\\Users\\EPS01\\Desktop\\JSON_DATA\\menu.json"));
			for (int i = 0; i < moArrays.size(); i++) {
				JsonObject module = moArrays.get(i).getAsJsonObject();
				//System.out.println("obj module:"+module.toString());
				Module m = new Module();
				m.setModuleName( module.has("module_name") ? module.get("module_name").getAsString() : null);
				m.setModuleIcon( module.has("module_icon") ? module.get("module_icon").getAsString() : null);
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
					//System.out.println("menuArrays::"+menuArrays);
					for (int k = 0; k < menuArrays.size(); k++) {
						JsonObject menu = menuArrays.get(k).getAsJsonObject();
						Menu men = new Menu();
						men.setMenuName(menu.has("menu_name") ? menu.get("menu_name").getAsString() : null);
						men.setHasLink(menu.has("isLink") ? menu.get("isLink").getAsBoolean() : null);
						men.setLink(menu.has("url") ? menu.get("url").getAsString() : null);
						men.setStatus(menu.has("status") ? menu.get("status").getAsString() : null);
						men.setModule(m);
						menus.add(men);
						
						//System.out.println("menuuu:::"+men.toString());
					}
				}
				
				m.setMenus(menus);
				moduleRepository.save(m);
			}
			
			JsonArray stateArrays = p.parse(new FileReader(ResourceUtils.getFile("classpath:static/json_files/state_list.json"))).getAsJsonArray();
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

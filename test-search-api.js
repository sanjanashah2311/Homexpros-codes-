#!/usr/bin/env node

const axios = require("axios");

const API_BASE = "http://localhost:5000/api";

async function testSearchAPI() {
  console.log("Testing HomeXPros Search API...\n");

  try {
    // Test 1: Get service categories
    console.log("1. Testing GET /services/categories");
    const categoriesResponse = await axios.get(`${API_BASE}/services/categories`);
    console.log(`✅ Categories found: ${categoriesResponse.data.data?.length || 0}`);
    if (categoriesResponse.data.data?.length > 0) {
      console.log(
        "   Sample categories:",
        categoriesResponse.data.data
          .slice(0, 3)
          .map((c) => c.name)
          .join(", ")
      );
    }
    console.log("");

    // Test 2: Get all services
    console.log("2. Testing GET /services");
    const servicesResponse = await axios.get(`${API_BASE}/services`);
    console.log(`✅ Services found: ${servicesResponse.data.data?.length || 0}`);
    if (servicesResponse.data.data?.length > 0) {
      console.log(
        "   Sample services:",
        servicesResponse.data.data
          .slice(0, 3)
          .map((s) => s.name)
          .join(", ")
      );
    }
    console.log("");

    // Test 3: Search services
    console.log("3. Testing GET /services/search");
    const searchResponse = await axios.get(`${API_BASE}/services/search?q=cleaning`);
    console.log(`✅ Search results for "cleaning": ${searchResponse.data.data?.length || 0}`);
    if (searchResponse.data.data?.length > 0) {
      const service = searchResponse.data.data[0];
      console.log(`   Sample result: ${service.name} - $${service.price}`);
      if (service.provider) {
        console.log(`   Provider: ${service.provider.businessName || "N/A"}`);
      }
    }
    console.log("");

    // Test 4: Search with location
    console.log("4. Testing GET /services/search with location");
    const locationSearchResponse = await axios.get(`${API_BASE}/services/search?location=Toronto`);
    console.log(
      `✅ Search results for location "Toronto": ${locationSearchResponse.data.data?.length || 0}`
    );
    console.log("");

    console.log("🎉 All API tests completed successfully!");
  } catch (error) {
    console.error("❌ API Test failed:", error.message);
    if (error.response) {
      console.error("   Status:", error.response.status);
      console.error("   Data:", error.response.data);
    }

    console.log("\n💡 Make sure the backend server is running:");
    console.log("   cd server && npm run dev");
  }
}

testSearchAPI();

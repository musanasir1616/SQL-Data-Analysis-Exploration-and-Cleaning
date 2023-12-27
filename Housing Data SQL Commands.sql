--Data Cleaning

--Selecting All Data in the Dataset
SELECT * FROM [HousingData]..HousingData

-- Standardize Date Format

--Selecting the SaleDate and also selecting the converting SaleDate to date format
Select SaleDate, CONVERT(date, SaleDate) FROM [HousingData]..HousingData
--Creating a New column 'SaleDateConvert' to add it to the table
ALTER Table HousingData ADD SaleDateConvert date
--Updating the new colum with the converted SaleDate
UPDATE HousingData
set SaleDateConvert = CONVERT(date, SaleDate)
--Deleting the SaleDate Column
ALTER TABLE HousingData DROP COLUMN SaleDate

-- Populate Property Address data
--Selecting and joining the table together based on the percel id and unique id
SELECT a.ParcelID, b.ParcelID, a.PropertyAddress, b.PropertyAddress, ISNULL(a.PropertyAddress,b.PropertyAddress)
FROM HousingData..HousingData AS a JOIN HousingData..HousingData AS b
ON a.ParcelID = b.ParcelID AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress is NULL

--Updating the table to populate the NULL cell 
UPDATE a
SET a.PropertyAddress = b.PropertyAddress 
FROM HousingData..HousingData AS a JOIN HousingData..HousingData AS b
ON a.ParcelID = b.ParcelID AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress is NULL


-- Breaking out Address into Individual Columns (Address, City, State)
SELECT PropertyAddress, PARSENAME(REPLACE(PropertyAddress, ',', '.'), 2) FROM [HousingData]..HousingData
--Creating a New Column 'PropertyStreet'
ALTER TABLE HousingData ADD  PropertyStreet VARCHAR(255)
--Updating the PropertyStreeet column with the divided part
UPDATE HousingData 
SET PropertyStreet = PARSENAME(REPLACE(PropertyAddress, ',', '.'), 2)
--Creating a New Column 'PropertyCity'
ALTER TABLE HousingData ADD  PropertyCity VARCHAR(255)
--Updating the PropertyStreeet column with the other divided part
UPDATE HousingData
SET PropertyCity = PARSENAME(REPLACE(PropertyAddress, ',', '.'), 1)

--Deleting the PropertyAddress Column 
ALTER TABLE HousingData DROP COLUMN PropertyAddress

-- Change Y and N to Yes and No in "Sold as Vacant" field
--Selecting and Grouping the SoldAsVant to see the groping of thr field
SELECT  SoldAsVacant, COUNT(SoldAsVacant) FROM [HousingData] group by SoldAsVacant

--Updatiing any field that has 'N' to 'No'
UPDATE  HousingData
SET SoldAsVacant = 'NO'
WHERE SoldAsVacant = 'N'

--Updatiing any field that has 'Y' to 'Yes'
UPDATE  HousingData
SET SoldAsVacant = 'Yes'
WHERE SoldAsVacant = 'Y'








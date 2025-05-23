<?php
// Package Model
class Package {
    private $conn;
    private $table_name = "package";

    // Properties for all columns in the package table
    public $PackageID;
    public $PackageName;
    public $Description;
    public $Type;
    public $Price;
    public $FreeMinutes;
    public $FreeSMS;
    public $FreeGB;
    public $old_price;
    public $Contract;
    public $IsPopular;
    public $DownloadSpeed;
    public $UploadSpeed;
    public $SetupFee;
    public $Brand;
    public $Rating;
    public $UpfrontCost;
    public $img; // ✅ Added

    public function __construct($db) {
        $this->conn = $db;
    }

    // Read all packages
    public function readAll() {
        $query = "SELECT * FROM " . $this->table_name;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // Read one package by ID
    public function readOne() {
        $query = "SELECT * FROM " . $this->table_name . " WHERE PackageID = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->PackageID);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $this->PackageName = $row['PackageName'];
            $this->Description = $row['Description'];
            $this->Type = $row['Type'];
            $this->Price = $row['Price'];
            $this->FreeMinutes = $row['FreeMinutes'];
            $this->FreeSMS = $row['FreeSMS'];
            $this->FreeGB = $row['FreeGB'];
            $this->old_price = $row['old_price'];
            $this->Contract = $row['Contract'];
            $this->IsPopular = $row['IsPopular'];
            $this->DownloadSpeed = $row['DownloadSpeed'];
            $this->UploadSpeed = $row['UploadSpeed'];
            $this->SetupFee = $row['SetupFee'];
            $this->Brand = $row['Brand'];
            $this->Rating = $row['Rating'];
            $this->UpfrontCost = $row['UpfrontCost'];
            $this->img = $row['img']; // ✅ Added
        } else {
            echo "⚠️ No package found for ID: {$this->PackageID}<br>";
        }
    }

    // Filter packages by type
    public function readByType($type) {
        $query = "SELECT * FROM " . $this->table_name . " WHERE Type = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $type);
        $stmt->execute();
        return $stmt;
    }

    // Create package
    public function create() {
        $query = "INSERT INTO " . $this->table_name . " 
                  SET PackageName=:name, Description=:desc, Type=:type, 
                      Price=:price, FreeMinutes=:minutes, FreeSMS=:sms, FreeGB=:gb, 
                      old_price=:old_price, Contract=:contract, IsPopular=:is_popular, 
                      DownloadSpeed=:download_speed, UploadSpeed=:upload_speed, 
                      SetupFee=:setup_fee, 
                      Brand=:brand, Rating=:rating, UpfrontCost=:upfront_cost, img=:img"; // ✅ Added

        $stmt = $this->conn->prepare($query);

        // Sanitize and bind values
        $this->PackageName = htmlspecialchars(strip_tags($this->PackageName));
        $this->Description = htmlspecialchars(strip_tags($this->Description));
        $this->Type = htmlspecialchars(strip_tags($this->Type));
        $this->Price = htmlspecialchars(strip_tags($this->Price));
        $this->FreeMinutes = htmlspecialchars(strip_tags($this->FreeMinutes));
        $this->FreeSMS = htmlspecialchars(strip_tags($this->FreeSMS));
        $this->FreeGB = htmlspecialchars(strip_tags($this->FreeGB));
        $this->old_price = htmlspecialchars(strip_tags($this->old_price));
        $this->Contract = htmlspecialchars(strip_tags($this->Contract));
        $this->IsPopular = htmlspecialchars(strip_tags($this->IsPopular));
        $this->DownloadSpeed = htmlspecialchars(strip_tags($this->DownloadSpeed));
        $this->UploadSpeed = htmlspecialchars(strip_tags($this->UploadSpeed));
        $this->SetupFee = htmlspecialchars(strip_tags($this->SetupFee));
        $this->Brand = htmlspecialchars(strip_tags($this->Brand));
        $this->Rating = htmlspecialchars(strip_tags($this->Rating));
        $this->UpfrontCost = htmlspecialchars(strip_tags($this->UpfrontCost));
        $this->img = htmlspecialchars(strip_tags($this->img)); // ✅ Added

        $stmt->bindParam(":name", $this->PackageName);
        $stmt->bindParam(":desc", $this->Description);
        $stmt->bindParam(":type", $this->Type);
        $stmt->bindParam(":price", $this->Price);
        $stmt->bindParam(":minutes", $this->FreeMinutes);
        $stmt->bindParam(":sms", $this->FreeSMS);
        $stmt->bindParam(":gb", $this->FreeGB);
        $stmt->bindParam(":old_price", $this->old_price);
        $stmt->bindParam(":contract", $this->Contract);
        $stmt->bindParam(":is_popular", $this->IsPopular);
        $stmt->bindParam(":download_speed", $this->DownloadSpeed);
        $stmt->bindParam(":upload_speed", $this->UploadSpeed);
        $stmt->bindParam(":setup_fee", $this->SetupFee);
        $stmt->bindParam(":brand", $this->Brand);
        $stmt->bindParam(":rating", $this->Rating);
        $stmt->bindParam(":upfront_cost", $this->UpfrontCost);
        $stmt->bindParam(":img", $this->img); // ✅ Added

        return $stmt->execute();
    }

    // Update package
    public function update() {
        $query = "UPDATE " . $this->table_name . "
                  SET PackageName=:name, Description=:desc, Type=:type, 
                      Price=:price, FreeMinutes=:minutes, FreeSMS=:sms, FreeGB=:gb, 
                      old_price=:old_price, Contract=:contract, IsPopular=:is_popular, 
                      DownloadSpeed=:download_speed, UploadSpeed=:upload_speed, 
                      SetupFee=:setup_fee, 
                      Brand=:brand, Rating=:rating, UpfrontCost=:upfront_cost, img=:img 
                  WHERE PackageID=:id"; // ✅ Added

        $stmt = $this->conn->prepare($query);

        // Sanitize and bind values
        $this->PackageName = htmlspecialchars(strip_tags($this->PackageName));
        $this->Description = htmlspecialchars(strip_tags($this->Description));
        $this->Type = htmlspecialchars(strip_tags($this->Type));
        $this->Price = htmlspecialchars(strip_tags($this->Price));
        $this->FreeMinutes = htmlspecialchars(strip_tags($this->FreeMinutes));
        $this->FreeSMS = htmlspecialchars(strip_tags($this->FreeSMS));
        $this->FreeGB = htmlspecialchars(strip_tags($this->FreeGB));
        $this->old_price = htmlspecialchars(strip_tags($this->old_price));
        $this->Contract = htmlspecialchars(strip_tags($this->Contract));
        $this->IsPopular = htmlspecialchars(strip_tags($this->IsPopular));
        $this->DownloadSpeed = htmlspecialchars(strip_tags($this->DownloadSpeed));
        $this->UploadSpeed = htmlspecialchars(strip_tags($this->UploadSpeed));
        $this->SetupFee = htmlspecialchars(strip_tags($this->SetupFee));
        $this->Brand = htmlspecialchars(strip_tags($this->Brand));
        $this->Rating = htmlspecialchars(strip_tags($this->Rating));
        $this->UpfrontCost = htmlspecialchars(strip_tags($this->UpfrontCost));
        $this->img = htmlspecialchars(strip_tags($this->img)); // ✅ Added
        $this->PackageID = htmlspecialchars(strip_tags($this->PackageID));

        $stmt->bindParam(":name", $this->PackageName);
        $stmt->bindParam(":desc", $this->Description);
        $stmt->bindParam(":type", $this->Type);
        $stmt->bindParam(":price", $this->Price);
        $stmt->bindParam(":minutes", $this->FreeMinutes);
        $stmt->bindParam(":sms", $this->FreeSMS);
        $stmt->bindParam(":gb", $this->FreeGB);
        $stmt->bindParam(":old_price", $this->old_price);
        $stmt->bindParam(":contract", $this->Contract);
        $stmt->bindParam(":is_popular", $this->IsPopular);
        $stmt->bindParam(":download_speed", $this->DownloadSpeed);
        $stmt->bindParam(":upload_speed", $this->UploadSpeed);
        $stmt->bindParam(":setup_fee", $this->SetupFee);
        $stmt->bindParam(":brand", $this->Brand);
        $stmt->bindParam(":rating", $this->Rating);
        $stmt->bindParam(":upfront_cost", $this->UpfrontCost);
        $stmt->bindParam(":img", $this->img); // ✅ Added
        $stmt->bindParam(":id", $this->PackageID);

        return $stmt->execute();
    }

    // Delete package
    public function delete() {
        $query = "DELETE FROM " . $this->table_name . " WHERE PackageID = ?";
        $stmt = $this->conn->prepare($query);
        $this->PackageID = htmlspecialchars(strip_tags($this->PackageID));
        $stmt->bindParam(1, $this->PackageID);

        return $stmt->execute();
    }
}
?>

<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="食物名称" prop="foodName">
        <el-input
          v-model="queryParams.foodName"
          placeholder="请输入食物名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="保质期" prop="qualityTime">
        <el-date-picker clearable
          v-model="queryParams.qualityTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择保质期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="所属者" prop="ownerName">
        <el-input
          v-model="queryParams.ownerName"
          placeholder="请输入所属者"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否打开" prop="isUsed">
        <el-input
          v-model="queryParams.isUsed"
          placeholder="请输入是否打开"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="打开时间" prop="openTime">
        <el-date-picker clearable
          v-model="queryParams.openTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择打开时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="冰箱ID" prop="fridgeId">
        <el-input
          v-model="queryParams.fridgeId"
          placeholder="请输入冰箱ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['appservice:food_info:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['appservice:food_info:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['appservice:food_info:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['appservice:food_info:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="food_infoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="食物ID" align="center" prop="foodId" />
      <el-table-column label="食物名称" align="center" prop="foodName" />
      <el-table-column label="保质期" align="center" prop="qualityTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.qualityTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="所属者" align="center" prop="ownerName" />
      <el-table-column label="是否打开" align="center" prop="isUsed" />
      <el-table-column label="打开时间" align="center" prop="openTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.openTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="冰箱ID" align="center" prop="fridgeId" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['appservice:food_info:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['appservice:food_info:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改食物信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="食物名称" prop="foodName">
          <el-input v-model="form.foodName" placeholder="请输入食物名称" />
        </el-form-item>
        <el-form-item label="保质期" prop="qualityTime">
          <el-date-picker clearable
            v-model="form.qualityTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择保质期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="所属者" prop="ownerName">
          <el-input v-model="form.ownerName" placeholder="请输入所属者" />
        </el-form-item>
        <el-form-item label="是否打开" prop="isUsed">
          <el-input v-model="form.isUsed" placeholder="请输入是否打开" />
        </el-form-item>
        <el-form-item label="打开时间" prop="openTime">
          <el-date-picker clearable
            v-model="form.openTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择打开时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="冰箱ID" prop="fridgeId">
          <el-input v-model="form.fridgeId" placeholder="请输入冰箱ID" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listFood_info, getFood_info, delFood_info, addFood_info, updateFood_info } from "@/api/appservice/food_info";

export default {
  name: "Food_info",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 食物信息表格数据
      food_infoList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        foodName: null,
        qualityTime: null,
        ownerName: null,
        isUsed: null,
        openTime: null,
        fridgeId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        foodName: [
          { required: true, message: "食物名称不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询食物信息列表 */
    getList() {
      this.loading = true;
      listFood_info(this.queryParams).then(response => {
        this.food_infoList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        foodId: null,
        foodName: null,
        qualityTime: null,
        ownerName: null,
        isUsed: null,
        openTime: null,
        fridgeId: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.foodId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加食物信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const foodId = row.foodId || this.ids
      getFood_info(foodId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改食物信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.foodId != null) {
            updateFood_info(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addFood_info(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const foodIds = row.foodId || this.ids;
      this.$modal.confirm('是否确认删除食物信息编号为"' + foodIds + '"的数据项？').then(function() {
        return delFood_info(foodIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('appservice/food_info/export', {
        ...this.queryParams
      }, `food_info_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
